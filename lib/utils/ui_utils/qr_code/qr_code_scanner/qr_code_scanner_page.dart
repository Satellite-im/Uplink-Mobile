import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'qr_code_scanner_feedback_dialogs.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage>
    with TickerProviderStateMixin {
  final _cameraController =
      MobileScannerController(formats: [BarcodeFormat.qrCode]);

  final _friendController = GetIt.I.get<FriendBloc>();
  var _lastQRCodeScanned = '';
  var _isDialogOpened = false;
  final _didKeyCodeBeginning = 'did:key:';
  final _timerDuration = const Duration(milliseconds: 750);
  late VoidCallback _timerFunction;

  @override
  void initState() {
    super.initState();
    _friendController
      ..add(ListIncomingFriendRequestsStarted())
      ..add(ListOutgoingFriendRequestsStarted())
      ..add(ListFriendsStarted());
    _timerFunction = () {
      _lastQRCodeScanned = '';
      _isDialogOpened = false;
    };
  }

  @override
  void dispose() {
    _friendController.add(ResetFriendDataStarted());
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'User QR Code Scanner',
        actionList: [
          IconButton(
            color: UColors.white,
            icon: ValueListenableBuilder(
              valueListenable: _cameraController.torchState,
              builder: (context, state, child) {
                switch (state) {
                  case TorchState.off:
                    return const Icon(Icons.flash_off, color: UColors.defGrey);
                  case TorchState.on:
                    return const Icon(
                      Icons.flash_on,
                      color: UColors.idleYellow,
                    );
                }
              },
            ),
            iconSize: UIconSize.normal.toDouble(),
            onPressed: _cameraController.toggleTorch,
          ),
          IconButton(
            color: UColors.white,
            icon: ValueListenableBuilder(
              valueListenable: _cameraController.cameraFacingState,
              builder: (context, state, child) {
                return const UIcon(UIcons.swap_camera);
              },
            ),
            iconSize: UIconSize.normal.toDouble(),
            onPressed: _cameraController.switchCamera,
          ),
        ],
      ),
      body: MobileScanner(
        allowDuplicates: true,
        controller: _cameraController,
        onDetect: (qrCode, args) {
          if (qrCode.rawValue == null ||
              _lastQRCodeScanned == qrCode.rawValue ||
              _isDialogOpened) {
            return;
          } else {
            final code = qrCode.rawValue!;
            if (code.contains(_didKeyCodeBeginning)) {
              _friendController.add(
                SearchUserStarted(
                  userDid: code.replaceAll(_didKeyCodeBeginning, ''),
                ),
              );
              _friendController.stream.listen((state) {
                if (state is FriendLoadSuccess && _isDialogOpened == false) {
                  _isDialogOpened = true;
                  _verifyRelationShipBetweenUsers(_friendController.user!);
                } else if (state is FriendLoadFailure &&
                    _isDialogOpened == false) {
                  _isDialogOpened = true;
                  _QRCodeScannerFeedbackDialogs.showErrorAccountNotFoundDialog(
                    context,
                    onPopButtonTap: () {
                      Timer(_timerDuration, () {
                        _timerFunction.call();
                      });
                    },
                  );
                }
                _lastQRCodeScanned = qrCode.rawValue!;
              });
            } else {
              _isDialogOpened = true;
              _lastQRCodeScanned = qrCode.rawValue!;

              _QRCodeScannerFeedbackDialogs.showErrorInvalidQRCodeDialog(
                context,
                onPopButtonTap: () {
                  Timer(_timerDuration, () {
                    _timerFunction.call();
                  });
                },
              );
            }
          }
        },
      ),
    );
  }

  void _verifyRelationShipBetweenUsers(User user) {
    final _areUsersFriends =
        _friendController.friendsList.any((element) => element.did == user.did);
    final _isThereIncomingFriendRequest = _friendController
        .incomingFriendRequestsList
        .any((element) => element.user.did == user.did);
    final _isThereOutgoingFriendRequest = _friendController
        .outgoingFriendRequestsList
        .any((element) => element.user.did == user.did);

    if (_areUsersFriends) {
      _QRCodeScannerFeedbackDialogs.showUsersAreAlreadyFriendsDialog(
        context,
        user,
        onTap: () {
          Timer(_timerDuration, () {
            _timerFunction.call();
          });
          Navigator.of(context).pop();
        },
      );
    } else if (_isThereIncomingFriendRequest) {
      _QRCodeScannerFeedbackDialogs.showOtherUserAlreadySentFriendRequestDialog(
        context,
        user,
        onTap: () {
          _friendController.add(FriendRequestAcceptanceStarted(user));
          Timer(_timerDuration, () {
            _timerFunction.call();
          });
          Navigator.of(context).pop();
        },
      );
    } else if (_isThereOutgoingFriendRequest) {
      _QRCodeScannerFeedbackDialogs.showCurrentUserSentFriendRequestDialog(
        context,
        user,
        onTap: () {
          Timer(_timerDuration, () {
            _timerFunction.call();
          });
          Navigator.of(context).pop();
        },
      );
    } else {
      _QRCodeScannerFeedbackDialogs.showSendFriendRequestToOtherUserDialog(
        context,
        user,
        _friendController,
        onPopButtonTap: () {
          Timer(_timerDuration, () {
            _timerFunction.call();
          });
        },
        onTap: () {
          _friendController.add(SendFriendRequestStarted());
          Navigator.of(context).pop();
          _QRCodeScannerFeedbackDialogs.showFriendRequestSentDialog(
            context,
            user,
            onTap: () {
              _friendController.add(ListOutgoingFriendRequestsStarted());
              Navigator.of(context).pop();
              Timer(_timerDuration, () {
                _timerFunction.call();
              });
            },
          );
        },
      );
    }
  }
}
