import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UImageButton extends StatefulWidget {
  ///Used in file session to preview image
  ///
  ///Build from a [UImage] as image source
  ///
  ///When [isDeleting] set to true, it will show a checkbox
  ///
  ///You can use [isSelected] in UImageButtonState to get it is checked or not
  ///
  ///All the boolean properties are false by default
  const UImageButton.uImage({
    Key? key,
    required this.uImage,
    this.isFavored,
    this.isDeleting,
    this.onSelected,
    this.unSelected,
    this.isChecked,
  })  : unit8ListImage = null,
        super(key: key);

  ///Used in file session to preview image
  ///
  ///Build from [Uint8List] as image source
  ///
  ///When [isDeleting] set to true, it will show a checkbox
  ///
  ///You can use [isSelected] in UImageButtonState to get it is checked or not
  ///
  ///All the boolean properties are false by default
  const UImageButton.unit8ListImage({
    Key? key,
    required this.unit8ListImage,
    this.isFavored,
    this.isDeleting,
    this.onSelected,
    this.unSelected,
    this.isChecked,
  })  : uImage = null,
        super(key: key);

  final Uint8List? unit8ListImage;
  final UImage? uImage;
  final bool? isFavored;
  final bool? isDeleting;
  final VoidCallback? onSelected;
  final VoidCallback? unSelected;
  final bool? isChecked;

  @override
  State<UImageButton> createState() => UImageButtonState();
}

class UImageButtonState extends State<UImageButton> {
  @override
  Widget build(BuildContext context) {
    // local variable for the icons/buttons on the image
    final _iconsLayer = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          if (widget.isFavored == true)
            const Align(
              alignment: Alignment.topRight,
              child: UIcon(
                UIcons.favorite,
                color: UColors.textMed,
              ),
            ),
          if (widget.isDeleting == true)
            Align(
              alignment: Alignment.bottomRight,
              child: AnimatedCrossFade(
                firstChild: IconButton(
                  splashColor: Colors.transparent,
                  icon: const UIcon(
                    UIcons.select_box,
                    color: UColors.textMed,
                  ),
                  onPressed: () {
                    widget.onSelected?.call();
                  },
                ),
                secondChild: IconButton(
                  splashColor: Colors.transparent,
                  icon: const UIcon(
                    UIcons.checkmark_2,
                    color: UColors.ctaBlue,
                  ),
                  onPressed: () {
                    widget.unSelected?.call();
                  },
                ),
                crossFadeState: widget.isChecked!
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 100),
                reverseDuration: const Duration(milliseconds: 100),
              ),
            ),
        ],
      ),
    );

    if (widget.uImage != null) {
      return SizedBox(
        height: USizes.imageButtonHeight,
        width: USizes.imageButtonWidth,
        child: Stack(children: [
          ClipRRect(
            child: widget.uImage,
            borderRadius: BorderRadius.circular(4),
          ),
          Align(
            child: _iconsLayer,
          ),
        ]),
      );
    }

    return Container(
      height: USizes.imageButtonHeight,
      width: USizes.imageButtonWidth,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          image: DecorationImage(
              colorFilter: widget.isDeleting == true
                  ? widget.isChecked!
                      ? ColorFilter.mode(
                          UColors.white.withOpacity(0.35),
                          BlendMode.overlay,
                        )
                      : null
                  : null,
              image: MemoryImage(widget.unit8ListImage!),
              fit: BoxFit.cover)),
      child: _iconsLayer,
    );
  }
}
