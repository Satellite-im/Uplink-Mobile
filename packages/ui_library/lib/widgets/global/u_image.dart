import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

/// Define what is the source of the image
enum ImageSource { network, local, file }

class UImage extends StatelessWidget {
  /// A class to handle all images of all app
  ///
  /// if imageSource is null, the value will be [ImageSource.network]
  const UImage({
    Key? key,
    this.imagePath,

    /// Define what is the source of the image
    ///
    /// if null, the value will be [ImageSource.network]
    this.imageSource = ImageSource.network,
    this.fit,
  }) : super(key: key);

  final String? imagePath;

  /// Define what is the source of the image
  final ImageSource? imageSource;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      switch (imageSource) {
        case ImageSource.network:
          return Image.network(
            imagePath!,
            fit: fit,
            errorBuilder: (context, error, stackTrace) => Container(
              color: UColors.defGrey,
            ),
          );
        case ImageSource.local:
          return Image.asset(
            imagePath!,
            fit: fit,
            errorBuilder: (context, error, stackTrace) => Container(
              color: UColors.defGrey,
            ),
          );
        case ImageSource.file:
          return Image.file(
            File(imagePath!),
            fit: fit,
            errorBuilder: (context, error, stackTrace) => Container(
              color: UColors.defGrey,
            ),
          );
        default:
          return Container(
            color: UColors.defGrey,
          );
      }
    } else {
      return Container(
        color: UColors.defGrey,
      );
    }
  }
}
