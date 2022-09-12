part of '../onboard_recovery_seed_page.dart';

class _RecoverySeedBoxes extends StatefulWidget {
  const _RecoverySeedBoxes({
    Key? key,
  }) : super(key: key);

  @override
  State<_RecoverySeedBoxes> createState() => _RecoverySeedBoxesState();
}

class _RecoverySeedBoxesState extends State<_RecoverySeedBoxes> {
  final _warpController = GetIt.I.get<WarpBloc>();
  late List<String> _seedList;
  @override
  void initState() {
    super.initState();
    _seedList = _warpController.get12RecoverySeeds().split(' ');
  }

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
