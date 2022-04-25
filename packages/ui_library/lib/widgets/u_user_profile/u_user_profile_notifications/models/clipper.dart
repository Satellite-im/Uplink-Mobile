part of '../u_user_profile_notification.dart';

/// This class is used to design the format of User Profile widgets
///
/// For each [Size] it will calculate and cut off the part necessary
///
/// To use the Clipper, it is necessary to pass as parameter to [ClipPath]
///
/// Example:
/// ```dart
/// ClipPath(
///  clipper: UClipperUserProfileStatus(),
///   child: SizedBox(
///    height: _size,
///    width: _size,
///    child: _imagePath != null
///             ? Image.network(_imagePath!)
///              : Image.asset(
///                 'packages/ui_library/images/placeholders/user_avatar_2.png',
///        ),
///     ),
///  ),
/// ```
class UClipperUserProfileNotifications extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    if (size.width == USizes.userProfileNormalSize) {
      path = _clipForNormalSize(path, size);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _clipForNormalSize(Path path, Size size) {
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
        size.height * 0.91, size.width * 0.75, size.height * 0.9);
    path.cubicTo(size.width * 0.75, size.height * 0.82, size.width * 0.82,
        size.height * 0.75, size.width * 0.9, size.height * 0.75);
    path.cubicTo(size.width * 0.91, size.height * 0.75, size.width * 0.92,
        size.height * 0.75, size.width * 0.93, size.height * 0.75);
    path.cubicTo(size.width * 0.93, size.height * 0.75, size.width * 0.93,
        size.height * 0.75, size.width * 0.93, size.height * 0.75);
    return path;
  }
}
