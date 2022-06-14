part of '../profile_index_page.dart';

class _ProfileIndexBody extends StatelessWidget {
  const _ProfileIndexBody({
    Key? key,
    required int badgesQuantity,
  })  : _badgesQuantity = badgesQuantity,
        super(key: key);

  final int _badgesQuantity;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            _ProfileData(
              badgesQuantity: _badgesQuantity,
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
                    UAppStrings.profileIndexPage_aboutTitle,
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
                UAppStrings.profileIndexPage_aboutDescription,
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
                    UAppStrings.profileIndexPage_setStatus,
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
            const _NetworkProfiles(
              networkProfile: NetworkProfiles.spotify,
              networkUsername: UAppStrings.profileIndexPage_spotifyUsername,
            ),
            const SizedBox.square(
              dimension: 20,
            ),
            const _NetworkProfiles(
              networkProfile: NetworkProfiles.twitch,
              networkUsername: UAppStrings.profileIndexPage_twitchUsername,
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
