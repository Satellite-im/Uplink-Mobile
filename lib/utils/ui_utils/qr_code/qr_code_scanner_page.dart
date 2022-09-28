import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class QRCodeScannerPage extends StatefulWidget {
  const QRCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<QRCodeScannerPage> createState() => _QRCodeScannerPageState();
}

class _QRCodeScannerPageState extends State<QRCodeScannerPage>
    with TickerProviderStateMixin {
  final layerLink = LayerLink();
  late AnimationController? _animationController;
  late Animation<double> _animation;
  MobileScannerController cameraController = MobileScannerController();
  Timer _timerForOverlay = Timer(Duration.zero, () {});

  final _friendController = GetIt.I.get<FriendBloc>();
  var _lastQRCodeScanned = '';
  var _isDialogOpened = false;
  final _didKeyCodeBeginning = 'did:key:';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
    _friendController
      ..add(ListIncomingFriendRequestsStarted())
      ..add(ListOutgoingFriendRequestsStarted())
      ..add(ListFriendsStarted());

    Timer.periodic(const Duration(seconds: 3), (timer) {
      _lastQRCodeScanned = '';
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _timerForOverlay.cancel();
    cameraController.dispose();
    super.dispose();
  }

  void showErrorOverlay(
    BuildContext context, {
    required String text,
  }) {
    final overlay = Overlay.of(context);
    final leftOffset = MediaQuery.of(context).size.width / 2 - 50;
    final _positionY = MediaQuery.of(context).size.height - 200;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: Offset(leftOffset, _positionY),
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: _animation.value,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 48),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 9, 16, 8),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: UColors.termRed,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: UText(
                      text,
                      textStyle: UTextStyle.B2_medium,
                      textColor: UColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    _animationController?.addListener(() {
      overlay!.setState(() {});
    });
    overlay!.insert(overlayEntry);
    _animationController?.forward();
    _timerForOverlay = Timer(
      const Duration(milliseconds: 1000),
      () {
        _animationController?.reverse().whenComplete(
              overlayEntry.remove,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'User QR Code Scanner',
        actionList: [
          IconButton(
            color: UColors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.torchState,
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
            onPressed: () => cameraController.toggleTorch(),
          ),
          IconButton(
            color: UColors.white,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                return const UIcon(UIcons.swap_camera);
              },
            ),
            iconSize: UIconSize.normal.toDouble(),
            onPressed: () => cameraController.switchCamera(),
          ),
        ],
      ),
      body: CompositedTransformTarget(
        link: layerLink,
        child: MobileScanner(
          allowDuplicates: true,
          controller: cameraController,
          onDetect: (qrCode, args) {
            if (qrCode.format != BarcodeFormat.qrCode && !_isDialogOpened) {
              showErrorOverlay(
                context,
                text: 'Error: It is not a QR Code',
              );
              return;
            }
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
                  } else if (state is FriendLoadFailure) {
                    showErrorOverlay(
                      context,
                      text: state.frienLoadFailureTypes!.errorMessage,
                    );
                  }
                  _lastQRCodeScanned = qrCode.rawValue!;
                });
              } else {
                showErrorOverlay(
                  context,
                  text: 'Error: Not a valid user ID',
                );
              }
            }
          },
        ),
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
      showDialog<void>(
        context: context,
        builder: (context) => UDialogUserProfile(
          showPopButton: false,
          bodyText: '',
          useBodyRichText: true,
          bodyRichText: RichText(
            text: TextSpan(
              children: <TextSpan>[
                TextSpan(
                  text: 'You and ',
                  style: UTextStyle.B1_body.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
                TextSpan(
                  text: user.username,
                  style: UTextStyle.B3_bold.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
                TextSpan(
                  text: ' are already friends!',
                  style: UTextStyle.B1_body.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
              ],
            ),
          ),
          popButtonText: UAppStrings.goBackButton,
          username: user.username,
          statusMessage: user.statusMessage,
          uImage: UImage(
            imagePath: user.profilePicture?.path,
            imageSource: ImageSource.file,
            fit: BoxFit.cover,
          ),
          buttonText: UAppStrings.okay,
          onTap: () {
            Navigator.of(context).pop();
            _isDialogOpened = false;
          },
        ),
      );
    } else if (_isThereIncomingFriendRequest) {
      showDialog<void>(
        context: context,
        builder: (context) => UDialogUserProfile(
          bodyText: '',
          useBodyRichText: true,
          bodyRichText: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: user.username,
                  style: UTextStyle.B3_bold.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
                TextSpan(
                  text: ' has already sent you a friend request. '
                      'Do you want to accept it?',
                  style: UTextStyle.B1_body.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
              ],
            ),
          ),
          popButtonText: UAppStrings.goBackButton,
          username: user.username,
          statusMessage: user.statusMessage,
          uImage: UImage(
            imagePath: user.profilePicture?.path,
            imageSource: ImageSource.file,
            fit: BoxFit.cover,
          ),
          buttonText: UAppStrings.okay,
          onTap: () {
            _friendController.add(FriendRequestAcceptanceStarted(user));
            _isDialogOpened = false;
            Navigator.of(context).pop();
          },
        ),
      );
    } else if (_isThereOutgoingFriendRequest) {
      showDialog<void>(
        context: context,
        builder: (context) => UDialogUserProfile(
          showPopButton: false,
          bodyText: '',
          useBodyRichText: true,
          bodyRichText: RichText(
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                TextSpan(
                  text: 'You already sent a friend request to ',
                  style: UTextStyle.B1_body.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
                TextSpan(
                  text: user.username,
                  style: UTextStyle.B3_bold.style.returnTextStyleType(
                    color: UColors.white,
                  ),
                ),
              ],
            ),
          ),
          popButtonText: UAppStrings.goBackButton,
          username: user.username,
          statusMessage: user.statusMessage,
          uImage: UImage(
            imagePath: user.profilePicture?.path,
            imageSource: ImageSource.file,
            fit: BoxFit.cover,
          ),
          buttonText: UAppStrings.okay,
          onTap: () {
            Navigator.of(context).pop();
            _isDialogOpened = false;
          },
        ),
      );
    } else {
      showDialog<void>(
        context: context,
        builder: (context) => BlocBuilder<FriendBloc, FriendState>(
          bloc: _friendController,
          builder: (context, state) {
            if (state is FriendLoadSuccess) {
              return UDialogUserProfile(
                bodyText: '',
                useBodyRichText: true,
                bodyRichText: RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Do you want to add ',
                        style: UTextStyle.B1_body.style.returnTextStyleType(
                          color: UColors.white,
                        ),
                      ),
                      TextSpan(
                        text: user.username,
                        style: UTextStyle.B3_bold.style.returnTextStyleType(
                          color: UColors.white,
                        ),
                      ),
                      TextSpan(
                        text: " to your contact's list?",
                        style: UTextStyle.B1_body.style.returnTextStyleType(
                          color: UColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                popButtonText: UAppStrings.goBackButton,
                popButtonOnTap: () => _isDialogOpened = false,
                username: state.user!.username,
                statusMessage: state.user!.statusMessage,
                uImage: UImage(
                  imagePath: state.user!.profilePicture?.path,
                  imageSource: ImageSource.file,
                  fit: BoxFit.cover,
                ),
                buttonText: UAppStrings.qrCodePage_addFriendDialogButtonText,
                onTap: () {
                  _friendController.add(SendFriendRequestStarted());
                  _isDialogOpened = false;
                },
              );
            } else if (state is FriendLoadFailure) {
              Navigator.of(context).pop();
            }
            return const SizedBox.shrink();
          },
        ),
      );
    }
  }
}
