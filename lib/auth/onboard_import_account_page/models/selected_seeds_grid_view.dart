import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class SelectedSeedsGridView extends StatefulWidget {
  const SelectedSeedsGridView({
    Key? key,
    required this.selectedPassphraseList,
    required this.cancelSelectionFinished,
    required this.cancelWrongSeed,
  }) : super(key: key);
  final List<String> selectedPassphraseList;
  final void Function() cancelSelectionFinished;
  final void Function() cancelWrongSeed;

  @override
  State<SelectedSeedsGridView> createState() => SelectedSeedsGridViewState();
}

class SelectedSeedsGridViewState extends State<SelectedSeedsGridView> {
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
            widget.selectedPassphraseList.length,
            (index) => URecoverySeedBox(
              word: widget.selectedPassphraseList[index],
              wordNumber: index + 1,
              onDelete: () {
                if (widget.selectedPassphraseList.length == 12) {
                  widget.cancelSelectionFinished();
                }
                setState(() {
                  widget.selectedPassphraseList.removeAt(index);
                });
                widget.cancelWrongSeed();
              },
            ),
          ),
        ),
      ],
    );
  }
}
