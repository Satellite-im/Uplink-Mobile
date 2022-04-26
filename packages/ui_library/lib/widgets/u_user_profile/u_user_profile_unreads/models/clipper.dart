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
  UserProfileUnreadsClipper(this.numberOfMessages);

  final int numberOfMessages;

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (numberOfMessages < 10) {
      path = _clipForNumbersWithOneDigit(path, size);
    } else if (numberOfMessages < 100) {
      path = _clipForNumbersWithTwoDigits(path, size);
    } else if (numberOfMessages < 1000) {
      path = _clipForNumbersWithThreeDigits(path, size);
    } else if (numberOfMessages < 10000) {
      path = _clipForNumbersWithFourDigits(path, size);
    } else {
      path = _clipForNumbersWithFourDigits(path, size);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _clipForNumbersWithOneDigit(Path path, Size size) {
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

  Path _clipForNumbersWithTwoDigits(Path path, Size size) {
    path.moveTo(size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.54, size.width, size.height * 0.52,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.6, size.width * 0.03, size.height * 0.69,
        size.width * 0.08, size.height * 0.77);
    path.cubicTo(size.width * 0.08, size.height * 0.75, size.width * 0.08,
        size.height * 0.74, size.width * 0.08, size.height * 0.72);
    path.cubicTo(size.width * 0.08, size.height * 0.57, size.width / 5,
        size.height * 0.45, size.width * 0.35, size.height * 0.45);
    path.cubicTo(size.width * 0.35, size.height * 0.45, size.width * 0.78,
        size.height * 0.45, size.width * 0.78, size.height * 0.45);
    path.cubicTo(size.width * 0.87, size.height * 0.45, size.width * 0.95,
        size.height * 0.49, size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.56, size.width, size.height * 0.56,
        size.width, size.height * 0.56);
    path.lineTo(size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.48, size.height,
        size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.49, size.height, size.width * 0.49, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.51, size.height, size.width * 0.51, size.height,
        size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.52, size.height,
        size.width * 0.52, size.height);

    path.moveTo(size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.6, size.width * 0.03, size.height * 0.69,
        size.width * 0.08, size.height * 0.76);
    path.cubicTo(size.width * 0.08, size.height * 0.76, size.width * 0.08,
        size.height * 0.75, size.width * 0.08, size.height * 0.75);
    path.cubicTo(size.width * 0.08, size.height * 0.58, size.width / 5,
        size.height * 0.45, size.width * 0.38, size.height * 0.45);
    path.cubicTo(size.width * 0.38, size.height * 0.45, size.width * 0.75,
        size.height * 0.45, size.width * 0.75, size.height * 0.45);
    path.cubicTo(size.width * 0.85, size.height * 0.45, size.width * 0.94,
        size.height / 2, size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.58,
        size.width, size.height * 0.58);

    path.moveTo(size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.74, size.width * 0.17, size.height * 0.94,
        size.width * 0.39, size.height);
    path.cubicTo(size.width * 0.32, size.height * 0.93, size.width * 0.28,
        size.height * 0.85, size.width * 0.28, size.height * 0.75);
    path.cubicTo(size.width * 0.28, size.height * 0.58, size.width * 0.41,
        size.height * 0.45, size.width * 0.58, size.height * 0.45);
    path.cubicTo(size.width * 0.58, size.height * 0.45, size.width * 0.75,
        size.height * 0.45, size.width * 0.75, size.height * 0.45);
    path.cubicTo(size.width * 0.85, size.height * 0.45, size.width * 0.94,
        size.height / 2, size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.58,
        size.width, size.height * 0.58);
    return path;
  }

  Path _clipForNumbersWithThreeDigits(Path path, Size size) {
    path.moveTo(size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.54, size.width, size.height * 0.52,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.6, size.width * 0.03, size.height * 0.69,
        size.width * 0.08, size.height * 0.77);
    path.cubicTo(size.width * 0.08, size.height * 0.75, size.width * 0.08,
        size.height * 0.74, size.width * 0.08, size.height * 0.72);
    path.cubicTo(size.width * 0.08, size.height * 0.57, size.width / 5,
        size.height * 0.45, size.width * 0.35, size.height * 0.45);
    path.cubicTo(size.width * 0.35, size.height * 0.45, size.width * 0.78,
        size.height * 0.45, size.width * 0.78, size.height * 0.45);
    path.cubicTo(size.width * 0.87, size.height * 0.45, size.width * 0.95,
        size.height * 0.49, size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.56, size.width, size.height * 0.56,
        size.width, size.height * 0.56);
    path.lineTo(size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.48, size.height,
        size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.49, size.height, size.width * 0.49, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.51, size.height, size.width * 0.51, size.height,
        size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.52, size.height,
        size.width * 0.52, size.height);

    path.moveTo(size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.6, size.width * 0.03, size.height * 0.69,
        size.width * 0.08, size.height * 0.76);
    path.cubicTo(size.width * 0.08, size.height * 0.76, size.width * 0.08,
        size.height * 0.75, size.width * 0.08, size.height * 0.75);
    path.cubicTo(size.width * 0.08, size.height * 0.58, size.width / 5,
        size.height * 0.45, size.width * 0.38, size.height * 0.45);
    path.cubicTo(size.width * 0.38, size.height * 0.45, size.width * 0.75,
        size.height * 0.45, size.width * 0.75, size.height * 0.45);
    path.cubicTo(size.width * 0.85, size.height * 0.45, size.width * 0.94,
        size.height / 2, size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.58,
        size.width, size.height * 0.58);
    return path;
  }

  Path _clipForNumbersWithFourDigits(Path path, Size size) {
    path.moveTo(size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.54, size.width, size.height * 0.52,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(
        0, size.height / 2, 0, size.height * 0.51, 0, size.height * 0.51);
    path.cubicTo(size.width * 0.05, size.height * 0.47, size.width * 0.11,
        size.height * 0.45, size.width * 0.17, size.height * 0.45);
    path.cubicTo(size.width * 0.17, size.height * 0.45, size.width * 0.78,
        size.height * 0.45, size.width * 0.78, size.height * 0.45);
    path.cubicTo(size.width * 0.87, size.height * 0.45, size.width * 0.95,
        size.height * 0.49, size.width, size.height * 0.56);
    path.cubicTo(size.width, size.height * 0.56, size.width, size.height * 0.56,
        size.width, size.height * 0.56);
    path.lineTo(size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.48, size.height,
        size.width * 0.48, size.height);
    path.cubicTo(size.width * 0.49, size.height, size.width * 0.49, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.51, size.height, size.width * 0.51, size.height,
        size.width * 0.52, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.52, size.height,
        size.width * 0.52, size.height);

    path.moveTo(size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.55, size.width, size.height * 0.53,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(
        0, size.height * 0.51, 0, size.height * 0.52, 0, size.height * 0.53);
    path.cubicTo(size.width * 0.05, size.height * 0.48, size.width * 0.12,
        size.height * 0.45, size.width / 5, size.height * 0.45);
    path.cubicTo(size.width / 5, size.height * 0.45, size.width * 0.75,
        size.height * 0.45, size.width * 0.75, size.height * 0.45);
    path.cubicTo(size.width * 0.85, size.height * 0.45, size.width * 0.94,
        size.height / 2, size.width, size.height * 0.58);
    path.cubicTo(size.width, size.height * 0.58, size.width, size.height * 0.58,
        size.width, size.height * 0.58);
    return path;
  }
}
