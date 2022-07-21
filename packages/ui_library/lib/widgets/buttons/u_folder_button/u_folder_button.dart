import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UFolderButton extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Container(
      height: 168,
      width: 160,
      decoration: BoxDecoration(
          color: UColors.backgroundDark,
          borderRadius: BorderRadius.circular(4)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            if (isLinked == true)
              const Align(
                alignment: Alignment.topLeft,
                child: UIcon(
                  UIcons.link_button,
                  color: UColors.textMed,
                ),
              ),
            if (isFavored == true)
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UText(
                      name,
                      textStyle: UTextStyle.H5_fifthHeader,
                      textColor: UColors.white,
                    ),
                    itemNum > 1
                        ? UText(
                            '$itemNum items',
                            textStyle: UTextStyle.M1_micro,
                            textColor: UColors.textDark,
                          )
                        : UText(
                            '$itemNum item',
                            textStyle: UTextStyle.M1_micro,
                            textColor: UColors.textDark,
                          ),
                  ],
                )),
            if (isDeleting == true)
              const Align(
                alignment: Alignment.bottomRight,
                child: UIcon(
                  UIcons.remove,
                  color: UColors.textMed,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
