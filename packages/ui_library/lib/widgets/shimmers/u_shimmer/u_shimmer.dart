import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_library/core/const/u_colors.dart';

enum ShimmerColor { dark, med, light, white }

class UShimmer extends StatelessWidget {
  final ShimmerColor shimmerColor;
  final Widget child;

  const UShimmer.dark({
    Key? key,
    required this.child,
  })  : shimmerColor = ShimmerColor.dark,
        super(key: key);
  const UShimmer.med({
    Key? key,
    required this.child,
  })  : shimmerColor = ShimmerColor.med,
        super(key: key);
  const UShimmer.light({
    Key? key,
    required this.child,
  })  : shimmerColor = ShimmerColor.light,
        super(key: key);
  const UShimmer.white({
    Key? key,
    required this.child,
  })  : shimmerColor = ShimmerColor.white,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _baseColor = UColors.white;
    Color _highlightColor = Colors.white;

    switch (shimmerColor) {
      case ShimmerColor.dark:
        _baseColor = UColors.loadDark;
        _highlightColor = UColors.loadMed;
        break;
      case ShimmerColor.med:
        _baseColor = UColors.loadMed;
        _highlightColor = UColors.loadLight;
        break;
      case ShimmerColor.light:
        _baseColor = UColors.loadLight;
        _highlightColor = UColors.white;
        break;
      default:
    }

    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: child,
    );
  }
}
