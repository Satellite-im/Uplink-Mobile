import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/u_sizes.dart';
import 'package:ui_library/widgets/u_user_profile/models/models_export.dart';
import 'package:ui_library/widgets/u_user_profile/u_user_profile_status.dart';

void main() {
  group('UClipperUserProfileStatus |', () {
    Path _clipForLargeSize(Size size) {
      Path path = Path();

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

    Path _clipForNormalSize(Size size) {
      Path path = Path();
      path.lineTo(size.width * 0.96, size.height * 0.69);
      path.cubicTo(size.width, size.height * 0.63, size.width,
          size.height * 0.57, size.width, size.height / 2);
      path.cubicTo(size.width, size.height * 0.22, size.width * 0.78, 0,
          size.width / 2, 0);
      path.cubicTo(
          size.width * 0.22, 0, 0, size.height * 0.22, 0, size.height / 2);
      path.cubicTo(0, size.height * 0.78, size.width * 0.22, size.height,
          size.width / 2, size.height);
      path.cubicTo(size.width * 0.57, size.height, size.width * 0.63,
          size.height, size.width * 0.69, size.height * 0.96);
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

    testWidgets(
      'Test clip path for USizes.userProfileLargeSize',
      (tester) async {
        const _size =
            Size(USizes.userProfileLargeSize, USizes.userProfileLargeSize);
        await tester.pumpWidget(
          const SystemUnderTest(size: _size),
        );
        await expectLater(find.byType(SystemUnderTest),
            matchesGoldenFile('userProfileStatusLargeSize.png'));
      },
      tags: 'golden',
    );
  });
}

class SystemUnderTest extends StatelessWidget {
  const SystemUnderTest({
    Key? key,
    required Size size,
  })  : _size = size,
        super(key: key);

  final Size _size;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('UI Library Show Room')),
        body: SafeArea(
          child: Center(
            child: UserProfileWithStatus(
              status: Status.online,
              userProfileSize: UUserProfileSize.large,
            ),
          ),
        ),
      ),
    );
  }
}
