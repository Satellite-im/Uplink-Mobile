// ignore_for_file: lines_longer_than_80_chars

import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/utils/ui_utils/qr_code/qr_code_bottom_sheet.dart';

part 'models/body.part.dart';
part 'models/delete_picture_popup_menu_widget.part.dart';
part 'models/edit_profile_body.dart';
part 'models/network_profiles_body.part.dart';
part 'models/profile_data_body.part.dart';

final _uTextInputStateForUsernameField = GlobalKey<UTextInputState>();
final _uTextInputStateForMessageStatusField = GlobalKey<UTextInputState>();

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
  final _controller = GetIt.I.get<CurrentUserBloc>();

  final scrollController = ScrollController();

  void _verifyIfHasImage() {
    if (_controller.currentUser!.bannerPicture != null &&
        _controller.currentUser!.bannerPicture!.path.isNotEmpty) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    aboutTextFieldController.dispose();
    locationTextFieldController.dispose();
    statusMessageTextFieldController.dispose();
    usernameTextFieldController.dispose();
    _uTextInputStateForUsernameField.currentState?.dispose();
    _uTextInputStateForMessageStatusField.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
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
                              _uTextInputStateForUsernameField.currentState!
                                  .resetValues();
                              _uTextInputStateForMessageStatusField
                                  .currentState!
                                  .resetValues();
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
                                  currentUser: _controller.currentUser!,
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
                        onPressed: () {
                          log('logout button');
                        },
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
                            header:
                                UAppStrings.profileIndexPage_bannerPhotoHeader,
                            firstButtonText: UAppStrings
                                .profileIndexPage_bannerPhotoFirstButtonText,
                            secondButtonText: UAppStrings
                                .profileIndexPage_bannerPhotoSecondButtonText,
                            firstButtonIcon: UIcons.camera,
                            secondButtonIcon: UIcons.image,
                            firstButtonOnPressed: () async {
                              final _bannerImageFile = await UImagePicker(
                                shouldShowPermissionDialog: true,
                              ).pickImageFromCamera(
                                context,
                                uCropStyle: UCropStyle.rectangle,
                                uCropAspectRatio: UCropAspectRatio(
                                  ratioX: _size.width,
                                  ratioY: 164,
                                ),
                              );
                              _controller.add(
                                UpdateBannerPicture(
                                  bannerPicture: _bannerImageFile!,
                                ),
                              );
                              _verifyIfHasImage();
                            },
                            secondButtonOnPressed: () async {
                              final _bannerImageFile =
                                  await UImagePicker().pickImageFromGallery(
                                context,
                                uCropStyle: UCropStyle.rectangle,
                                uCropAspectRatio: UCropAspectRatio(
                                  ratioX: _size.width,
                                  ratioY: 164,
                                ),
                              );
                              _controller.add(
                                UpdateBannerPicture(
                                  bannerPicture: _bannerImageFile!,
                                ),
                              );
                              _verifyIfHasImage();
                            },
                          ).show();
                        },
                      ),
                      _DeletePicturePopupMenu(
                        removeAvatarOnPressed: () {
                          _controller.add(
                            UpdateProfilePicture(
                              profilePicture: File(''),
                            ),
                          );
                        },
                        removeBannerOnPressed: () {
                          _controller.add(
                            UpdateBannerPicture(
                              bannerPicture: File(''),
                            ),
                          );
                        },
                      ),
                    ]
                  ],
                  flexibleSpace: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                    bloc: _controller,
                    builder: (context, state) {
                      if (state is CurrentUserLoadSuccess &&
                          _controller.currentUser?.bannerPicture != null) {
                        return SizedBox(
                          height: 164,
                          width: double.infinity,
                          child: UImage(
                            imagePath:
                                _controller.currentUser?.bannerPicture?.path,
                            imageSource: ImageSource.file,
                            fit: BoxFit.cover,
                          ),
                        );
                      } else {
                        return const SizedBox(
                          height: 164,
                          width: double.infinity,
                          child: UImage(
                            fit: BoxFit.cover,
                          ),
                        );
                      }
                    },
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
                        decoration: (_controller.currentUser?.bannerPicture ==
                                    null &&
                                _controller.currentUser?.profilePicture ==
                                    null &&
                                _controller.currentUser?.profilePicture?.path ==
                                    null &&
                                _controller.currentUser?.bannerPicture?.path ==
                                    null)
                            ? BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: UColors.backgroundDark,
                                ),
                              )
                            : null,
                        child: BlocBuilder<CurrentUserBloc, CurrentUserState>(
                          bloc: _controller,
                          builder: (context, state) {
                            if (state is CurrentUserLoadSuccess &&
                                _controller.currentUser?.profilePicture !=
                                    null) {
                              return UUserPictureChange(
                                showChangeImageButton: _isEditingProfile,
                                uImage: UImage(
                                  imagePath: _controller
                                      .currentUser?.profilePicture?.path,
                                  imageSource: ImageSource.file,
                                ),
                                onPictureSelected: (value) {
                                  _controller.add(
                                    UpdateProfilePicture(
                                      profilePicture: value!,
                                    ),
                                  );
                                },
                              );
                            } else {
                              return UUserPictureChange(
                                showChangeImageButton: _isEditingProfile,
                                uImage: const UImage(),
                                onPictureSelected: (value) {
                                  _controller.add(
                                    UpdateProfilePicture(
                                      profilePicture: value!,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ),
                      AnimatedCrossFade(
                        duration: _duration,
                        firstChild: _ProfileIndexBody(
                          controller: _controller,
                          pageSize: _size,
                          onTapEditProfile: (value) {
                            setState(() {
                              _isEditingProfile = value;
                            });
                          },
                        ),
                        secondChild: _EditProfileBody(
                          controller: _controller,
                          scrollController: scrollController,
                          onSaveChanges: (canSave) {
                            if (canSave) {
                              setState(() {
                                _isEditingProfile = false;
                                scrollController.animateTo(
                                  0,
                                  duration: const Duration(milliseconds: 100),
                                  curve: Curves.ease,
                                );
                              });
                            }
                          },
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
}
