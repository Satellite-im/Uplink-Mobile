import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

part 'models/header.part.dart';
part 'models/body.part.dart';
part 'models/profile_data_body.part.dart';
part 'models/network_profiles_body.part.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({Key? key}) : super(key: key);

  @override
  State<ProfileIndexPage> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState extends State<ProfileIndexPage> {
  final _badgesQuantity = 5;
  final _bottomNavBarHeight = Platform.isIOS ? 0 : 82;
  final _coverPicturePath =
      'packages/ui_library/images/placeholders/cover_photo_1.png';

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
                  leading: const SizedBox(),
                  actionList: [
                    IconButton(
                      icon: const UIcon(
                        UIcons.qr_code,
                        color: UColors.white,
                      ),
                      onPressed: () async {},
                    ),
                    IconButton(
                      icon: const UIcon(
                        UIcons.hamburger_menu,
                        color: UColors.white,
                      ),
                      onPressed: () async {},
                    ),
                  ],
                  flexibleSpace: SizedBox(
                    height: 164,
                    width: double.infinity,
                    child: Image(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        _coverPicturePath,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: _size.height + _bottomNavBarHeight,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Column(
                      children: [
                        _ProfileIndexHeader(
                          pageSize: _size,
                        ),
                        const SizedBox.square(
                          dimension: 16,
                        ),
                        _ProfileIndexBody(
                          badgesQuantity: _badgesQuantity,
                        ),
                      ],
                    ),
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
