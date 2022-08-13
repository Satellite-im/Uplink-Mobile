// ignore_for_file: lines_longer_than_80_chars

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_current_user.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';
import 'package:uplink/utils/ui_utils/qr_code/qr_code_bottom_sheet.dart';
import 'package:uplink/utils/warp/warp.dart';

part 'models/body.part.dart';
part 'models/edit_profile_body.dart';
part 'models/network_profiles_body.part.dart';
part 'models/profile_data_body.part.dart';
part 'models/delete_picture_popup_menu_widget.part.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({Key? key}) : super(key: key);

  @override
  State<ProfileIndexPage> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState extends State<ProfileIndexPage> {
  bool _isEditingProfile = false;
  final _duration = const Duration(milliseconds: 250);

  final usernameTextFieldController = TextEditingController();
  final statusMessageTextFieldController = TextEditingController();
  final locationTextFieldController = TextEditingController();
  final aboutTextFieldController = TextEditingController();

  String? userImagePath;

  File? _bannerImageFile;

  // TODO(Lucas): Warp is here and the profile pages just for Mock purposes, change these things later
  final warp = Warp();

  @override
  void initState() {
    warp.createUser(username: 'Meowth', messageStatus: 'I am a pokemon!');

    super.initState();
  }

  void _verifyIfHasImage() {
    if (_bannerImageFile != null && _bannerImageFile!.path.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return FutureBuilder<MockCurrentUser?>(
      future: loadingCurrentUser(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const SizedBox.shrink();
        } else {
          final _mockCurrentUser = snapshot.data;
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: CustomScrollView(
              controller: scrollController,
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
                                  UIcons.back_arrow,
                                  color: UColors.white,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    _isEditingProfile = false;
                                  });
                                },
                              )
                            : const SizedBox.shrink(),
                        actionList: [
                          if (!_isEditingProfile) ...[
                            IconButton(
                              icon: const UIcon(
                                UIcons.qr_code,
                                color: UColors.white,
                              ),
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  useRootNavigator: true,
                                  builder: (context) => GestureDetector(
                                    behavior: HitTestBehavior.opaque,
                                    onTap: () => Navigator.of(context).pop(),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: QRCodeBottomSheet(
                                        currentUser: _mockCurrentUser!,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const UIcon(
                                UIcons.hamburger_menu,
                                color: UColors.white,
                              ),
                              onPressed: () {},
                            ),
                          ] else ...[
                            IconButton(
                              icon: const UIcon(
                                UIcons.compose_message,
                                color: UColors.white,
                              ),
                              onPressed: () {
                                UBottomSheetTwoButtons(
                                  context,
                                  header: UAppStrings
                                      .profileIndexPage_bannerPhotoHeader,
                                  firstButtonText: UAppStrings
                                      .profileIndexPage_bannerPhotoFirstButtonText,
                                  secondButtonText: UAppStrings
                                      .profileIndexPage_bannerPhotoSecondButtonText,
                                  firstButtonIcon: UIcons.camera,
                                  secondButtonIcon: UIcons.image,
                                  firstButtonOnPressed: () async {
                                    _bannerImageFile = await UImagePicker(
                                      shouldShowPermissionDialog: true,
                                    ).pickImageFromCamera(
                                      context,
                                      uCropStyle: UCropStyle.rectangle,
                                      uCropAspectRatio: UCropAspectRatio(
                                        ratioX: _size.width,
                                        ratioY: 164,
                                      ),
                                    );
                                    _verifyIfHasImage();
                                    setState(() {});
                                  },
                                  secondButtonOnPressed: () async {
                                    _bannerImageFile = await UImagePicker()
                                        .pickImageFromGallery(
                                      context,
                                      uCropStyle: UCropStyle.rectangle,
                                      uCropAspectRatio: UCropAspectRatio(
                                        ratioX: _size.width,
                                        ratioY: 164,
                                      ),
                                    );
                                    _verifyIfHasImage();
                                    setState(() {});
                                  },
                                ).show();
                              },
                            ),
                            _DeletePicturePopupMenu(
                              removeAvatarOnPressed: () {
                                setState(() {
                                  userImagePath = null;
                                });
                              },
                              removeBannerOnPressed: () {
                                setState(() {
                                  _bannerImageFile = null;
                                });
                              },
                            ),
                          ]
                        ],
                        flexibleSpace: SizedBox(
                          height: 164,
                          width: double.infinity,
                          child: UImage(
                            imagePath: _bannerImageFile?.path ??
                                _mockCurrentUser?.bannerImageAddress,
                            imageSource: _bannerImageFile != null
                                ? ImageSource.local
                                : ImageSource.network,
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
                            Container(
                              decoration: (_bannerImageFile == null &&
                                      userImagePath == null &&
                                      _mockCurrentUser?.imageAddress == null &&
                                      _mockCurrentUser?.bannerImageAddress ==
                                          null)
                                  ? BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: UColors.backgroundDark,
                                      ),
                                    )
                                  : null,
                              child: UUserPictureChange(
                                showChangeImageButton: _isEditingProfile,
                                uImage: UImage(
                                  imagePath: userImagePath ??
                                      _mockCurrentUser?.imageAddress,
                                  imageSource: userImagePath == null
                                      ? ImageSource.network
                                      : ImageSource.local,
                                ),
                                onPictureSelected: (value) {
                                  setState(() {
                                    userImagePath = value?.path;
                                  });
                                },
                              ),
                            ),
                            AnimatedCrossFade(
                              duration: _duration,
                              firstChild: _ProfileIndexBody(
                                warp: warp,
                                currentUser: _mockCurrentUser!,
                                pageSize: _size,
                                onTapEditProfile: (value) {
                                  setState(() {
                                    _isEditingProfile = value;
                                  });
                                },
                              ),
                              secondChild: _EditProfileBody(
                                warp: warp,
                                onSaveChanges: (value) {
                                  setState(() {
                                    _isEditingProfile = false;
                                    scrollController.animateTo(
                                      0,
                                      duration:
                                          const Duration(milliseconds: 100),
                                      curve: Curves.ease,
                                    );
                                  });
                                },
                                usernameTextFieldController:
                                    usernameTextFieldController,
                                statusMessageTextFieldController:
                                    statusMessageTextFieldController,
                                locationTextFieldController:
                                    locationTextFieldController,
                                aboutTextFieldController:
                                    aboutTextFieldController,
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
      },
    );
  }
}
