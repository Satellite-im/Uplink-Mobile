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
  }) : super(key: key);
// TODO(yijing): get user current state info(through id)
  final MockContact user;
  final ScrollController? controller;
  final double? reduecdTopHeight;
  final double? backButtonOpacity;
  final bool? isFromBottomSheet;

  @override
  State<UserProfilePage> createState() => UserProfilePageState();
}

class UserProfilePageState extends State<UserProfilePage>
    with SingleTickerProviderStateMixin {
  late MockContact user;
  late double backButtonOpacity;
  // used to connect draggableScrollableSheet
  ScrollController? controller;
  // used to reduce the top height when it is bottom sheet
  late double reduecdTopHeight;
  // for back navigation in vertical direction of bottomsheet
  late AnimationController _animationController;
  late bool _isFromBottomSheet;

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
    } else {
      reduecdTopHeight = 0;
    }
    if (widget.backButtonOpacity != null) {
      backButtonOpacity = widget.backButtonOpacity!;
    } else {
      backButtonOpacity = 1;
    }
    if (widget.isFromBottomSheet != null) {
      _isFromBottomSheet = widget.isFromBottomSheet!;
    } else {
      _isFromBottomSheet = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
          .animate(_animationController),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: CustomScrollView(
          controller: controller,
          slivers: [
            SliverToBoxAdapter(
              child: Stack(
                children: [
                  AppBarWithBanner(
                    user: user,
                    backButtonOpacity: backButtonOpacity,
                    reduecdTopHeight: reduecdTopHeight,
                    backButtonOnPressed: () {
                      if (_isFromBottomSheet == true) {
                        _animationController.forward().whenComplete(
                              () => Navigator.of(context, rootNavigator: true)
                                  .pop(),
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
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox.square(
                    dimension: 16,
                  ),
                  CTAButton(
                    user: user,
                  ),
                  const SizedBox.square(
                    dimension: 16,
                  ),
                  UserGroupedInfo(user: user),
                  const SizedBox.square(
                    dimension: 24,
                  ),
                ]),
              ),
            ),
            const SliverToBoxAdapter(
              child: UDivider(height: 1),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox.square(
                    dimension: 16,
                  ),
                  UserAbout(user: user),
                  const SizedBox.square(
                    dimension: 24,
                  ),
                  // TODO(yijing): add note function
                  const UserNote(),
                ]),
              ),
            ),
            if (linkedAccountsList.isNotEmpty && user.isBlocked == false)
              const SliverToBoxAdapter(
                child: UDivider(height: 1),
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
    );
  }
}
