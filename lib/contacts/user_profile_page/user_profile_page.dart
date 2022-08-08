import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/user_profile_page/models/models_export.dart';
import 'package:uplink/utils/mock/data/data_export.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({
    Key? key,
    required this.user,
    this.controller,
    this.reduecdTopHeight,
    this.backButtonOpacity,
    this.isFromBottomSheet,
    this.showHomeIndicator,
  }) : super(key: key);
// TODO(yijing): get user current state info(through id)
  final MockContact user;
  final ScrollController? controller;
  final double? reduecdTopHeight;
  final double? backButtonOpacity;
  final bool? isFromBottomSheet;
  final bool? showHomeIndicator;

  @override
  State<UserProfilePage> createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  late MockContact user;
  double backButtonOpacity = 1;
  // used to connect draggableScrollableSheet
  ScrollController? controller;
  // used to reduce the top height when it is bottom sheet
  double reduecdTopHeight = 0;
  // for back navigation in vertical direction of bottomsheet
  late AnimationController _animationController;
  bool _isFromBottomSheet = false;
  bool showHomeIndicator = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    user = widget.user;
    controller = widget.controller;

    if (widget.reduecdTopHeight != null) {
      reduecdTopHeight = widget.reduecdTopHeight!;
    }

    if (widget.backButtonOpacity != null) {
      backButtonOpacity = widget.backButtonOpacity!;
    }
    if (widget.isFromBottomSheet != null) {
      _isFromBottomSheet = widget.isFromBottomSheet!;
    }
    if (widget.showHomeIndicator != null) {
      showHomeIndicator = widget.showHomeIndicator!;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
          .animate(_animationController),
      child: WillPopScope(
        onWillPop: () async {
          if (showHomeIndicator == false) {
            await _animationController.forward().whenComplete(
                  () => Navigator.of(context).pop(),
                );
          }
          return true;
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            controller: controller,
            slivers: [
              if (showHomeIndicator == true)
                const SliverToBoxAdapter(
                  child: UHomeIndicator(),
                ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UColors.backgroundDark,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          AppBarWithBanner(
                            user: user,
                            backButtonOpacity: backButtonOpacity,
                            reduecdTopHeight: reduecdTopHeight,
                            backButtonOnPressed: () {
                              if (_isFromBottomSheet == true) {
                                _animationController.forward().whenComplete(
                                      () => Navigator.of(
                                        context,
                                        rootNavigator: true,
                                      ).pop(),
                                    );
                              } else {
                                Navigator.of(context).pop();
                              }
                            },
                          ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: Column(
                              children: [
                                const SizedBox.square(
                                  dimension: 114,
                                ),
                                UserBasicInfo(user: user),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox.square(
                        dimension: 16,
                      ),
                      SizedBox(
                        width: size.width - 32,
                        child: CTAButton(
                          user: user,
                        ),
                      ),
                      const SizedBox.square(
                        dimension: 16,
                      ),
                      UserGroupedInfo(user: user),
                      const SizedBox.square(
                        dimension: 24,
                      ),
                      const UDivider(height: 1),
                      const SizedBox.square(
                        dimension: 16,
                      ),
                      SizedBox(
                        width: size.width - 32,
                        child: UserAbout(user: user),
                      ),
                      const SizedBox.square(
                        dimension: 24,
                      ),
                      SizedBox(
                        width: size.width - 32,
                        // TODO(yijing): add note function
                        child: const UserNote(),
                      ),
                      if (linkedAccountsList.isNotEmpty &&
                          user.isBlocked == false)
                        const UDivider(height: 1),
                    ],
                  ),
                ),
              ),
              if (user.isBlocked == false)
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return UserLinkedAccount(
                        networkUsername:
                            linkedAccountsList[index]['username'] as String,
                        networkProfile: linkedAccountsList[index]['network']
                            as NetworkProfiles,
                      );
                    },
                    childCount: linkedAccountsList.length,
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
