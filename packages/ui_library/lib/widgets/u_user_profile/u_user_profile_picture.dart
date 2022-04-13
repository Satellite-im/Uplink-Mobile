import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import 'status_indicator.dart';

class UserProfileStatus extends StatelessWidget {
  UserProfileStatus.normal({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.medium(status),
        _size = USizes.userProfileNormalSize,
        super(key: key);

  UserProfileStatus.topMenuBar({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.small(status),
        _size = USizes.userProfileTopMenuBarSize,
        super(key: key);

  UserProfileStatus.large({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.large(status),
        _size = USizes.userProfileLargeSize,
        super(key: key);

  final double _size;

  final String? _imagePath;

  final StatusIndicator _statusIndicator;

  double _getCorrectPositionForEachAvatar() {
    if (_size == 56) {
      return 44;
    } else if (_size == 40) {
      return 28;
    } else {
      return 22;
    }
  }

  CustomClipper<Path> _getCorrectClipperForEachAvatar() {
    if (_size == 56) {
      return ArcClipperForLargeSize();
    } else if (_size == 40) {
      return ArcClipperForNormalSize();
    } else {
      return ArcClipperForTopMenuBarSize();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _correctPositionForEachAvatar = _getCorrectPositionForEachAvatar();
    final _correctClipperForEachAvatar = _getCorrectClipperForEachAvatar();

    return Stack(
      children: [
        SizedBox(
          child: ClipPath(
            clipper: _correctClipperForEachAvatar,
            child: SizedBox(
              height: _size,
              width: _size,
              child: _imagePath != null
                  ? Image.network(_imagePath!)
                  : Image.asset(
                      'packages/ui_library/images/placeholders/user_avatar_2.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        Positioned(
          top: _correctPositionForEachAvatar,
          left: _correctPositionForEachAvatar,
          child: _statusIndicator,
        ),
      ],
    );
  }
}

class ArcClipperForNormalSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path = Path();
    path.lineTo(size.width * 0.96, size.height * 0.69);
    path.cubicTo(size.width, size.height * 0.63, size.width, size.height * 0.57,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.57, size.height, size.width * 0.63, size.height,
        size.width * 0.69, size.height * 0.96);
    path.cubicTo(size.width * 0.66, size.height * 0.93, size.width * 0.65,
        size.height * 0.89, size.width * 0.65, size.height * 0.85);
    path.cubicTo(size.width * 0.65, size.height * 0.74, size.width * 0.74,
        size.height * 0.65, size.width * 0.85, size.height * 0.65);
    path.cubicTo(size.width * 0.89, size.height * 0.65, size.width * 0.93,
        size.height * 0.66, size.width * 0.96, size.height * 0.69);
    path.cubicTo(size.width * 0.96, size.height * 0.69, size.width * 0.96,
        size.height * 0.69, size.width * 0.96, size.height * 0.69);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArcClipperForLargeSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path = Path();
    path.lineTo(size.width * 0.93, size.height * 0.75);
    path.cubicTo(size.width * 0.97, size.height * 0.68, size.width,
        size.height * 0.59, size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.59, size.height, size.width * 0.68,
        size.height * 0.97, size.width * 0.75, size.height * 0.93);
    path.cubicTo(size.width * 0.75, size.height * 0.92, size.width * 0.75,
        size.height * 0.91, size.width * 0.75, size.height * 0.89);
    path.cubicTo(size.width * 0.75, size.height * 0.81, size.width * 0.81,
        size.height * 0.75, size.width * 0.89, size.height * 0.75);
    path.cubicTo(size.width * 0.91, size.height * 0.75, size.width * 0.92,
        size.height * 0.75, size.width * 0.93, size.height * 0.75);
    path.cubicTo(size.width * 0.93, size.height * 0.75, size.width * 0.93,
        size.height * 0.75, size.width * 0.93, size.height * 0.75);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class ArcClipperForTopMenuBarSize extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path = Path();
    path.lineTo(size.width * 0.96, size.height * 0.69);
    path.cubicTo(size.width, size.height * 0.63, size.width, size.height * 0.57,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.57, size.height, size.width * 0.63, size.height,
        size.width * 0.69, size.height * 0.96);
    path.cubicTo(size.width * 0.68, size.height * 0.93, size.width * 0.67,
        size.height * 0.9, size.width * 0.67, size.height * 0.87);
    path.cubicTo(size.width * 0.67, size.height * 0.76, size.width * 0.76,
        size.height * 0.67, size.width * 0.87, size.height * 0.67);
    path.cubicTo(size.width * 0.9, size.height * 0.67, size.width * 0.93,
        size.height * 0.68, size.width * 0.96, size.height * 0.69);
    path.cubicTo(size.width * 0.96, size.height * 0.69, size.width * 0.96,
        size.height * 0.69, size.width * 0.96, size.height * 0.69);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
