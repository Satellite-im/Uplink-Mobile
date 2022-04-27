part of 'u_clipper.dart';

class _ChatBubbleClipper extends CustomClipper<Path> {
  _ChatBubbleClipper(this.unreadMessages);

  final int unreadMessages;

  @override
  Path getClip(Size size) {
    Path path = Path();

    if (unreadMessages < 10) {
      path = _clipForUnreadMessagesWithOneDigit(path, size);
    } else if (unreadMessages < 100) {
      path = _clipForUnreadMessagesWithTwoDigits(path, size);
    } else if (unreadMessages < 1000) {
      path = _clipForUnreadMessagesWithThreeDigits(path, size);
    } else if (unreadMessages < 10000) {
      path = _clipForUnreadMessagesWithFourDigits(path, size);
    } else {
      path = _clipForUnreadMessagesWithFourDigits(path, size);
    }

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;

  Path _clipForUnreadMessagesWithOneDigit(Path path, Size size) {
    path.lineTo(size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.62, size.width, size.height * 0.56,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.56, size.height, size.width * 0.62, size.height,
        size.width * 0.67, size.height * 0.97);
    path.cubicTo(size.width * 0.63, size.height * 0.93, size.width * 0.61,
        size.height * 0.88, size.width * 0.61, size.height * 0.82);
    path.cubicTo(size.width * 0.61, size.height * 0.7, size.width * 0.7,
        size.height * 0.61, size.width * 0.82, size.height * 0.61);
    path.cubicTo(size.width * 0.88, size.height * 0.61, size.width * 0.93,
        size.height * 0.63, size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width * 0.97, size.height * 0.67, size.width * 0.97,
        size.height * 0.67, size.width * 0.97, size.height * 0.67);
    return path;
  }

  Path _clipForUnreadMessagesWithTwoDigits(Path path, Size size) {
    path.lineTo(size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.62, size.width, size.height * 0.56,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.52, size.height, size.width * 0.55, size.height,
        size.width * 0.57, size.height);
    path.cubicTo(size.width * 0.52, size.height * 0.96, size.width * 0.48,
        size.height * 0.89, size.width * 0.48, size.height * 0.82);
    path.cubicTo(size.width * 0.48, size.height * 0.7, size.width * 0.58,
        size.height * 0.61, size.width * 0.7, size.height * 0.61);
    path.cubicTo(size.width * 0.7, size.height * 0.61, size.width * 0.82,
        size.height * 0.61, size.width * 0.82, size.height * 0.61);
    path.cubicTo(size.width * 0.88, size.height * 0.61, size.width * 0.93,
        size.height * 0.63, size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width * 0.97, size.height * 0.67, size.width * 0.97,
        size.height * 0.67, size.width * 0.97, size.height * 0.67);
    return path;
  }

  Path _clipForUnreadMessagesWithThreeDigits(Path path, Size size) {
    path.lineTo(size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.62, size.width, size.height * 0.56,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.23, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.23, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.76, size.width * 0.19, size.height * 0.96,
        size.width * 0.43, size.height);
    path.cubicTo(size.width * 0.37, size.height * 0.96, size.width * 0.34,
        size.height * 0.9, size.width * 0.34, size.height * 0.83);
    path.cubicTo(size.width * 0.34, size.height * 0.71, size.width * 0.44,
        size.height * 0.61, size.width * 0.55, size.height * 0.61);
    path.cubicTo(size.width * 0.55, size.height * 0.61, size.width * 0.82,
        size.height * 0.61, size.width * 0.82, size.height * 0.61);
    path.cubicTo(size.width * 0.88, size.height * 0.61, size.width * 0.93,
        size.height * 0.63, size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width * 0.97, size.height * 0.67, size.width * 0.97,
        size.height * 0.67, size.width * 0.97, size.height * 0.67);
    return path;
  }

  Path _clipForUnreadMessagesWithFourDigits(Path path, Size size) {
    path.moveTo(size.width * 0.97, size.height * 0.66);
    path.cubicTo(size.width, size.height * 0.61, size.width, size.height * 0.56,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.58, size.width * 0.02, size.height * 0.66,
        size.width * 0.05, size.height * 0.72);
    path.cubicTo(size.width * 0.08, size.height * 0.65, size.width * 0.15,
        size.height * 0.61, size.width * 0.23, size.height * 0.61);
    path.cubicTo(size.width * 0.23, size.height * 0.61, size.width * 0.84,
        size.height * 0.61, size.width * 0.84, size.height * 0.61);
    path.cubicTo(size.width * 0.89, size.height * 0.61, size.width * 0.94,
        size.height * 0.63, size.width * 0.97, size.height * 0.66);
    path.cubicTo(size.width * 0.97, size.height * 0.66, size.width * 0.97,
        size.height * 0.66, size.width * 0.97, size.height * 0.66);
    path.lineTo(size.width * 0.51, size.height);
    path.cubicTo(size.width * 0.51, size.height, size.width * 0.49, size.height,
        size.width * 0.49, size.height);
    path.cubicTo(size.width * 0.49, size.height, size.width / 2, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width / 2, size.height, size.width * 0.51, size.height,
        size.width * 0.51, size.height);
    path.cubicTo(size.width * 0.51, size.height, size.width * 0.51, size.height,
        size.width * 0.51, size.height);

    path.moveTo(size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width, size.height * 0.62, size.width, size.height * 0.56,
        size.width, size.height / 2);
    path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
        size.width / 2, 0);
    path.cubicTo(
        size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
    path.cubicTo(0, size.height * 0.68, size.width * 0.1, size.height * 0.84,
        size.width * 0.24, size.height * 0.93);
    path.cubicTo(size.width * 0.22, size.height * 0.9, size.width / 5,
        size.height * 0.86, size.width / 5, size.height * 0.82);
    path.cubicTo(size.width / 5, size.height * 0.7, size.width * 0.31,
        size.height * 0.61, size.width * 0.43, size.height * 0.61);
    path.cubicTo(size.width * 0.43, size.height * 0.61, size.width * 0.82,
        size.height * 0.61, size.width * 0.82, size.height * 0.61);
    path.cubicTo(size.width * 0.88, size.height * 0.61, size.width * 0.93,
        size.height * 0.63, size.width * 0.97, size.height * 0.67);
    path.cubicTo(size.width * 0.97, size.height * 0.67, size.width * 0.97,
        size.height * 0.67, size.width * 0.97, size.height * 0.67);
    return path;
  }
}
