import 'package:flutter/material.dart';

import 'status_indicator.dart';

class UserProfileStatus extends StatelessWidget {
  const UserProfileStatus.normal({
    Key? key,
    String? imagePath,
    required String status,
  })  : _imagePath = imagePath,
        _status = status,
        _statusIndicator = const StatusIndicator.medium(),
        _width = 40.0,
        _height = 40.0,
        super(key: key);

  const UserProfileStatus.topMenuBar({
    Key? key,
    String? imagePath,
    required String status,
  })  : _imagePath = imagePath,
        _status = status,
        _statusIndicator = const StatusIndicator.small(),
        _width = 30.0,
        _height = 30.0,
        super(key: key);

  const UserProfileStatus.large({
    Key? key,
    String? imagePath,
    required String status,
  })  : _imagePath = imagePath,
        _status = status,
        _statusIndicator = const StatusIndicator.large(),
        _width = 56.0,
        _height = 56.0,
        super(key: key);

  final double _width;
  final double _height;

  final String? _imagePath;
  final String _status;

  final StatusIndicator _statusIndicator;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: ClipPath(
            clipper: ArcClipper(),
            child: SizedBox(
              height: _height,
              width: _width,
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
          top: _width / 1.42,
          left: _width / 1.42,
          child: _statusIndicator,
        ),
      ],
    );
  }
}

class ArcClipper extends CustomClipper<Path> {
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
