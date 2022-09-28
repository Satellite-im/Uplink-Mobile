import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';

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
            if (qrCode.rawValue == null ||
                _lastQRCodeScanned == qrCode.rawValue ||
                _isDialogOpened) {
              return;
            } else {
              final code = qrCode.rawValue!;
              _lastQRCodeScanned = qrCode.rawValue!;

              if (code.contains(_didKeyCodeBeginning)) {
                _friendController.add(
                  SearchUserStarted(
                    userDid:
                        _lastQRCodeScanned.replaceAll(_didKeyCodeBeginning, ''),
                  ),
                );
                _isDialogOpened = true;
                showDialog<void>(
                  context: context,
                  builder: (context) => BlocBuilder<FriendBloc, FriendState>(
                    bloc: _friendController,
                    builder: (context, state) {
                      if (state is FriendLoadSuccess) {
                        return UDialogUserProfile(
                          bodyText:
                              UAppStrings.qrCodePage_addFriendDialogMessage,
                          popButtonText: UAppStrings.goBackButton,
                          popButtonOnTap: () {
                            _isDialogOpened = false;
                          },
                          username: state.user!.username,
                          statusMessage: state.user!.statusMessage,
                          uImage: UImage(
                            imagePath: state.user!.profilePicture?.path,
                            imageSource: ImageSource.file,
                            fit: BoxFit.cover,
                          ),
                          buttonText:
                              UAppStrings.qrCodePage_addFriendDialogButtonText,
                          onTap: () {
                            _friendController.add(SendFriendRequestStarted());
                            _isDialogOpened = false;
                          },
                        );
                      } else if (state is FriendLoadFailure) {
                        Navigator.of(context).pop();
                        showErrorOverlay(
                          context,
                          text: state.frienLoadFailureTypes!.errorMessage,
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                );
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
}
