part of '../profile_index_page.dart';

class _ProfileData extends StatelessWidget {
  const _ProfileData({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final MockCurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_badges,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                SizedBox(
                  height: ((currentUser.badgesNum! / 3).ceil() * 24) +
                      ((currentUser.badgesNum! / 3).floor() * 4),
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
                          currentUser.badgesNum!,
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
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_location,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                UText(
                  currentUser.location!,
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          SizedBox(
            width: 104,
            child: Column(
              children: [
                const UText(
                  UAppStrings.profileIndexPage_friends,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                UText(
                  currentUser.friendNum!.toString(),
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
