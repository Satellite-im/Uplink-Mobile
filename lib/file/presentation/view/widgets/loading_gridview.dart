import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class LoadingGridView extends StatelessWidget {
  const LoadingGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 160 / 168,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Stack(
          children: const [
            UShimmer.med(
              child: URectContainer(),
            ),
            Align(
              alignment: Alignment(0.9, -0.9),
              child: UShimmer.light(
                child: URectContainer(
                  height: 24,
                  width: 24,
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.9, 0.9),
              child: UShimmer.light(
                child: URectContainer(
                  height: 24,
                  width: 24,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
