import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UImageButton extends StatefulWidget {
  ///Used in file session to preview image
  ///
  ///When [isDeleting] set to ture, it will show a checkbox
  ///
  ///You can use [isSelected] in UImageButtonState to get it is checked or not
  ///
  ///All the boolean properties are false by default
  const UImageButton.uImage({
    Key? key,
    required this.uImage,
    this.isFavored,
    this.isDeleting,
  })  : unit8ListImage = null,
        super(key: key);

  const UImageButton.unit8ListImage({
    Key? key,
    required this.unit8ListImage,
    this.isFavored,
    this.isDeleting,
  })  : uImage = null,
        super(key: key);

  final Uint8List? unit8ListImage;
  final UImage? uImage;
  final bool? isFavored;
  final bool? isDeleting;

  @override
  State<UImageButton> createState() => UImageButtonState();
}

class UImageButtonState extends State<UImageButton> {
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    isSelected = false;
  }

  @override
  Widget build(BuildContext context) {
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
            child: Padding(
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
                        firstChild: GestureDetector(
                          child: const UIcon(
                            UIcons.select_box,
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
                            UIcons.checkmark_2,
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
              image: MemoryImage(widget.unit8ListImage!), fit: BoxFit.cover)),
      child: Padding(
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
                  firstChild: GestureDetector(
                    child: const UIcon(
                      UIcons.select_box,
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
                      UIcons.checkmark_2,
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
