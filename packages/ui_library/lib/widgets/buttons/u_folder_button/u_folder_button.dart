import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UFolderButton extends StatefulWidget {
  ///Used in file session to represent a folder
  ///
  ///When [isDeleting] set to ture, it will show a checkbox
  ///
  ///You can use [isSelected] in UFolderButtonState to get it is checked or not
  ///
  ///All the boolean properties are false by default
  const UFolderButton({
    Key? key,
    required this.name,
    required this.itemNum,
    this.isLinked,
    this.isFavored,
    this.isDeleting,
  })  : assert(itemNum >= 0),
        super(key: key);

  final String name;
  final int itemNum;
  final bool? isLinked;
  final bool? isFavored;
  final bool? isDeleting;

  @override
  State<UFolderButton> createState() => UFolderButtonState();
}

class UFolderButtonState extends State<UFolderButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: USizes.folderButtonHeight,
      width: USizes.folderButtonWidth,
      decoration: BoxDecoration(
          color: UColors.backgroundDark,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            if (widget.isLinked == true)
              const Align(
                alignment: Alignment.topLeft,
                child: UIcon(
                  UIcons.link_button,
                  color: UColors.textMed,
                ),
              ),
            if (widget.isFavored == true)
              const Align(
                alignment: Alignment.topRight,
                child: UIcon(
                  UIcons.favorite_button,
                  color: UColors.textMed,
                ),
              ),
            Align(
              child: Image.asset(
                'packages/ui_library/images/file_graph/file_graph.png',
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      UText(
                        widget.name,
                        textStyle: UTextStyle.H5_fifthHeader,
                        textColor: UColors.white,
                      ),
                      widget.itemNum > 1
                          ? UText(
                              '${widget.itemNum} items',
                              textStyle: UTextStyle.M1_micro,
                              textColor: UColors.textDark,
                            )
                          : UText(
                              '${widget.itemNum} item',
                              textStyle: UTextStyle.M1_micro,
                              textColor: UColors.textDark,
                            ),
                    ],
                  ),
                )),
            if (widget.isDeleting == true)
              Align(
                alignment: Alignment.bottomRight,
                child: AnimatedCrossFade(
                  firstChild: GestureDetector(
                    child: const UIcon(
                      UIcons.tap_select_box,
                      color: UColors.textMed,
                    ),
                    onTap: () {
                      setState(() {
                        isSelected = true;
                      });
                    },
                  ),
                  secondChild: GestureDetector(
                    child: const UIcon(
                      UIcons.checkmark_rounded,
                      color: UColors.termRed,
                    ),
                    onTap: () {
                      setState(() {
                        isSelected = false;
                      });
                    },
                  ),
                  crossFadeState: isSelected
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 100),
                  reverseDuration: const Duration(milliseconds: 100),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
