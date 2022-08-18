part of '../profile_index_page.dart';

class _ProfileData extends StatelessWidget {
  const _ProfileData({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final UpdateCurrentUserBloc controller;

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
                  height: (((controller.currentUser?.badgesNum ?? 0) / 3)
                              .ceil() *
                          24) +
                      (((controller.currentUser?.badgesNum ?? 0) / 3).floor() *
                          4),
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
                          controller.currentUser?.badgesNum ?? 0,
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
                  controller.currentUser?.location ?? '',
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
                  controller.currentUser?.friendNum == null
                      ? '0'
                      : controller.currentUser!.friendNum.toString(),
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
