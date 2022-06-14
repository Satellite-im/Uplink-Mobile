part of '../profile_index_page.dart';

class _ProfileData extends StatelessWidget {
  const _ProfileData({
    Key? key,
    required int badgesQuantity,
  })  : _badgesQuantity = badgesQuantity,
        super(key: key);

  final int _badgesQuantity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            const UText(
              UAppStrings.profileIndexPage_badges,
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
              UAppStrings.profileIndexPage_location,
              textStyle: UTextStyle.H5_fifthHeader,
            ),
            SizedBox.square(
              dimension: 8,
            ),
            UText(
              UAppStrings.profileIndexPage_locationValue,
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.white,
            ),
          ],
        ),
        Column(
          children: const [
            UText(
              UAppStrings.profileIndexPage_friends,
              textStyle: UTextStyle.H5_fifthHeader,
            ),
            SizedBox.square(
              dimension: 8,
            ),
            UText(
              UAppStrings.profileIndexPage_friendsNumber,
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.white,
            ),
          ],
        ),
      ],
    );
  }
}
