part of '../u_user_profile_unreads.dart';

/// This class is used to design the format of User Profile widgets
///
/// For each [Size] it will calculate and cut off the part necessary
///
/// To use the Clipper, it is necessary to pass as parameter to [ClipPath]
///
/// Example:
/// ```dart
/// ClipPath(
///  clipper: UserProfileUnreadsClipper(),
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
class UserProfileUnreadsClipper extends CustomClipper<Path> {
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
    path.lineTo(size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.53, size.height, size.width * 0.55, size.height,
        size.width * 0.58, size.height);
    path.cubicTo(size.width / 2, size.height * 0.94, size.width * 0.45,
        size.height * 0.85, size.width * 0.45, size.height * 0.75);
    path.cubicTo(size.width * 0.45, size.height * 0.58, size.width * 0.58,
        size.height * 0.45, size.width * 0.75, size.height * 0.45);
    path.cubicTo(size.width * 0.85, size.height * 0.45, size.width * 0.94,
        size.height / 2, size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.58,
        size.width, size.height * 0.58);
    return path;
  }
}
