part of '../onboard_recovery_seed_page.dart';

List<String> _seedList = [
  'art',
  'bus',
  'drink',
  'frost',
  'hour',
  'cute',
  'fly',
  'frost',
  'hour',
  'grow',
  'join',
  'paint'
];

class _RecoverySeedBoxes extends StatelessWidget {
  const _RecoverySeedBoxes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        SliverGrid.count(
          crossAxisCount: 2,
          childAspectRatio: 160 / 40,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(
            12,
            (index) => URecoverySeedBox(
              word: _seedList[index],
              wordNumber: index + 1,
            ),
          ),
        ),
      ],
    );
  }
}
