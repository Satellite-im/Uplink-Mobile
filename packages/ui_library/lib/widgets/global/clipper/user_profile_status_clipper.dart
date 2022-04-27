part of 'u_clipper.dart';

class _UserProfileStatusClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    if (size.width == USizes.userProfileLargeSize) {
      path = _clipForLargeSize(path, size);
    } else if (size.width == USizes.userProfileNormalSize) {
      path = _clipForNormalSize(path, size);
    } else if (size.width == USizes.userProfileTopMenuBarSize) {
      path = _clipForTopMenuBarSize(path, size);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _clipForLargeSize(Path path, Size size) {
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
    return path;
  }

  Path _clipForNormalSize(Path path, Size size) {
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
    return path;
  }

  Path _clipForTopMenuBarSize(Path path, Size size) {
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
    return path;
  }
}
