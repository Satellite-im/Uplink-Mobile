import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

enum ImageSource { network, local, file }

class UImage extends StatelessWidget {
  const UImage({
    Key? key,
    this.imagePath,
    ImageSource? imageSource,
    this.fit,
  })  : _imageSource = imageSource ?? ImageSource.network,
        super(key: key);

  final String? imagePath;

  final ImageSource _imageSource;

  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (imagePath != null) {
      switch (_imageSource) {
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
