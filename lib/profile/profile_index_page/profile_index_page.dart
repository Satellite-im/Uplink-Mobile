import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/profile/qr_code_page.dart';

part 'models/body.part.dart';
part 'models/edit_profile_body.dart';
part 'models/network_profiles_body.part.dart';
part 'models/profile_data_body.part.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({Key? key}) : super(key: key);

  @override
  State<ProfileIndexPage> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState extends State<ProfileIndexPage> {
  final _badgesQuantity = 5;
  final _coverPicturePath =
      'packages/ui_library/images/placeholders/cover_photo_1.png';
  bool _isEditingProfile = false;
  final _duration = const Duration(milliseconds: 250);

  final usernameTextFieldController = TextEditingController();
  final statusMessageTextFieldController = TextEditingController();
  final locationTextFieldController = TextEditingController();
  final aboutTextFieldController = TextEditingController();

  String? userImagePath;

  File? _imageFile;

  void _verifyIfHasImage() {
    if (_imageFile != null && _imageFile!.path.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                UAppBar.actions(
                  title: '',
                  leading: _isEditingProfile
                      ? IconButton(
                          icon: const UIcon(
                            UIcons.back_arrow_button,
                            color: UColors.white,
                          ),
                          onPressed: () async {
                            setState(() {
                              _isEditingProfile = false;
                            });
                          },
                        )
                      : const SizedBox(),
                  actionList: [
                    if (!_isEditingProfile) ...[
                      IconButton(
                        icon: const UIcon(
                          UIcons.qr_code,
                          color: UColors.white,
                        ),
                        onPressed: () async {
                          await _uQRCodeBottomSheet(context).show();
                        },
                      ),
                      IconButton(
                        icon: const UIcon(
                          UIcons.hamburger_menu,
                          color: UColors.white,
                        ),
                        onPressed: () {},
                      ),
                    ] else
                      IconButton(
                        icon: const UIcon(
                          UIcons.compose_message_button,
                          color: UColors.white,
                        ),
                        onPressed: () {
                          UBottomSheetTwoButtons(
                            context,
                            header:
                                UAppStrings.profileIndexPage_bannerPhotoHeader,
                            firstButtonText: UAppStrings
                                .profileIndexPage_bannerPhotoFirstButtonText,
                            secondButtonText: UAppStrings
                                .profileIndexPage_bannerPhotoSecondButtonText,
                            firstButtonIcon: UIcons.camera,
                            secondButtonIcon: UIcons.image,
                            firstButtonOnPressed: () async {
                              _imageFile = await UImagePicker(
                                shouldShowPermissionDialog: true,
                              ).pickImageFromCamera(
                                context,
                                uCropStyle: UCropStyle.rectangle,
                              );
                              _verifyIfHasImage();
                              setState(() {});
                            },
                            secondButtonOnPressed: () async {
                              _imageFile =
                                  await UImagePicker().pickImageFromGallery(
                                context,
                                uCropStyle: UCropStyle.rectangle,
                              );
                              _verifyIfHasImage();
                              setState(() {});
                            },
                          ).show();
                        },
                      ),
                  ],
                  flexibleSpace: SizedBox(
                    height: 164,
                    width: double.infinity,
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            _coverPicturePath,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      const SizedBox.square(
                        dimension: 114,
                      ),
                      UUserPictureChange(
                        showChangeImageButton: _isEditingProfile,
                        onPictureSelected: (value) {
                          userImagePath = value?.path;
                        },
                      ),
                      AnimatedCrossFade(
                        duration: _duration,
                        firstChild: _ProfileIndexBody(
                          badgesQuantity: _badgesQuantity,
                          pageSize: _size,
                          onTapEditProfile: (value) {
                            setState(() {
                              _isEditingProfile = value;
                            });
                          },
                        ),
                        secondChild: _EditProfileBody(
                          usernameTextFieldController:
                              usernameTextFieldController,
                          statusMessageTextFieldController:
                              statusMessageTextFieldController,
                          locationTextFieldController:
                              locationTextFieldController,
                          aboutTextFieldController: aboutTextFieldController,
                        ),
                        crossFadeState: _isEditingProfile
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  UBottomSheet _uQRCodeBottomSheet(BuildContext context) {
    return UBottomSheet(
      context,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onVerticalDragUpdate: (details) {
          // TODO(Lucas): Improve the way to transition
          if (details.delta.dy < 0) {
            Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute<Widget>(
                fullscreenDialog: true,
                builder: (context) => QRCodePage(
                  userImagePath: userImagePath,
                ),
              ),
            );
          } else if (details.localPosition.dy > 0) {
            Navigator.of(context, rootNavigator: true).pop();
          }
        },
        onDoubleTap: () async {
          await Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute<Widget>(
              fullscreenDialog: true,
              builder: (context) => QRCodePage(
                userImagePath: userImagePath,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.fromLTRB(70, 30, 70, 37),
          child: Column(
            children: [
              Center(
                child: UUserProfile(
                  imagePath: userImagePath,
                ),
              ),
              const SizedBox.square(
                dimension: 12,
              ),
              const UText(
                UAppStrings.profileIndexPage_username,
                textStyle: UTextStyle.H2_secondaryHeader,
              ),
              const SizedBox.square(
                dimension: 2,
              ),
              const UText(
                UAppStrings.profileIndexPage_statusMessage,
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox.square(
                dimension: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UIcon(
                    UIcons.qr_code_scanner_border,
                    color: UColors.textMed,
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(math.pi),
                    child: const UIcon(
                      UIcons.qr_code_scanner_border,
                      color: UColors.textMed,
                    ),
                  )
                ],
              ),
              const SizedBox.square(
                dimension: 172,
                child: UQRCode(
                  qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationX(math.pi),
                    child: const UIcon(
                      UIcons.qr_code_scanner_border,
                      color: UColors.textMed,
                    ),
                  ),
                  Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(math.pi),
                    child: const UIcon(
                      UIcons.qr_code_scanner_border,
                      color: UColors.textMed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}