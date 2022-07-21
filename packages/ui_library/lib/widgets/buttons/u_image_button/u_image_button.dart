import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UImageButton extends StatelessWidget {
  const UImageButton({
    Key? key,
    required this.uImage,
    this.isLinked,
    this.isFavored,
    this.isDeleting,
  }) : super(key: key);

  final UImage uImage;
  final bool? isLinked;
  final bool? isFavored;
  final bool? isDeleting;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      width: 160,
      child: Stack(children: [
        ClipRRect(
          child: uImage,
          borderRadius: BorderRadius.circular(4),
        ),
        Align(
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
        ),
      ]),
    );
  }
}
