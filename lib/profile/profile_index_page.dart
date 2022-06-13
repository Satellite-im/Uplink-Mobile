import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ProfileIndexPage extends StatefulWidget {
  const ProfileIndexPage({Key? key}) : super(key: key);

  @override
  State<ProfileIndexPage> createState() => _ProfileIndexPageState();
}

class _ProfileIndexPageState extends State<ProfileIndexPage> {
  final _badgesQuantity = 5;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      appBar: UAppBar.actions(
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
        title: '',
        leading: const SizedBox(),
      ),
      body: SizedBox(
        height: _size.height,
        child: Stack(
          children: [
            const SizedBox(
              height: 164,
              width: double.infinity,
              child: Image(
                fit: BoxFit.cover,
                image: AssetImage(
                  'packages/ui_library/images/placeholders/cover_photo_1.png',
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
                    showChangeImageButton: false,
                    onPictureSelected: (value) {},
                  ),
                  const SizedBox.square(
                    dimension: 20,
                  ),
                  const UText(
                    'username',
                    textStyle: UTextStyle.H2_secondaryHeader,
                  ),
                  const SizedBox.square(
                    dimension: 2,
                  ),
                  const UText(
                    'Something something space station',
                    textStyle: UTextStyle.B1_body,
                  ),
                  const SizedBox.square(
                    dimension: 16,
                  ),
                  SizedBox(
                    width: _size.width - 32,
                    child: UButton.primary(
                      label: 'Edit Profile',
                      uIconData: UIcons.compose_message_button,
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox.square(
                    dimension: 16,
                  ),
                  ProfileBody(badgesQuantity: _badgesQuantity),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    Key? key,
    required int badgesQuantity,
  })  : _badgesQuantity = badgesQuantity,
        super(key: key);

  final int _badgesQuantity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const UText(
                      'Badges',
                      textStyle: UTextStyle.H5_fifthHeader,
                    ),
                    const SizedBox.square(
                      dimension: 8,
                    ),
                    SizedBox(
                      height: ((_badgesQuantity / 3).ceil() * 24) +
                          ((_badgesQuantity / 3).floor() * 4),
                      width: (3 * 24) + (2 * 4),
                      child: CustomScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        slivers: [
                          SliverGrid.count(
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            children: List.generate(
                              _badgesQuantity,
                              (index) => Container(
                                height: 24,
                                width: 24,
                                color: UColors.defGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const [
                    UText(
                      'Location',
                      textStyle: UTextStyle.H5_fifthHeader,
                    ),
                    SizedBox.square(
                      dimension: 8,
                    ),
                    UText(
                      'State, USA',
                      textStyle: UTextStyle.H5_fifthHeader,
                      textColor: UColors.white,
                    ),
                  ],
                ),
                Column(
                  children: const [
                    UText(
                      'Friends',
                      textStyle: UTextStyle.H5_fifthHeader,
                    ),
                    SizedBox.square(
                      dimension: 8,
                    ),
                    UText(
                      '24',
                      textStyle: UTextStyle.H5_fifthHeader,
                      textColor: UColors.white,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox.square(
              dimension: 24,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: UColors.foregroundDark,
            ),
            const SizedBox.square(
              dimension: 19,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: const [
                  UIcon(UIcons.about),
                  SizedBox.square(
                    dimension: 8,
                  ),
                  UText(
                    'About',
                    textStyle: UTextStyle.H3_tertiaryHeader,
                  ),
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 18,
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: UText(
                'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae beatae vitae dicta sunt explicabo. ',
                textStyle: UTextStyle.B1_body,
                textColor: UColors.white,
              ),
            ),
            const SizedBox.square(
              dimension: 24,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: UColors.foregroundDark,
            ),
            const SizedBox.square(
              dimension: 21,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  UText(
                    'Set Status',
                    textStyle: UTextStyle.H5_fifthHeader,
                  ),
                  UStatusText(
                    status: Status.online,
                  )
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: UColors.foregroundDark,
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UNetworksProfiles.spotifyProfile(
                    spotifyUsername: 'username12',
                  ),
                  USwitcher(
                    switchValue: true,
                    onSwitch: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: UColors.foregroundDark,
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const UNetworksProfiles.twitchProfile(
                    twitchUsername: 'username_plays',
                  ),
                  USwitcher(
                    switchValue: true,
                    onSwitch: (value) {},
                  ),
                ],
              ),
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: UColors.foregroundDark,
            ),
            const SizedBox.square(
              dimension: 32,
            ),
          ],
        ),
      ),
    );
  }
}
