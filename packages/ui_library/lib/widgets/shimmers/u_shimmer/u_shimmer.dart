import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ui_library/core/const/u_colors.dart';

enum ShimmerColor { dark, med, light, white }

class UShimmer extends StatelessWidget {
  final ShimmerColor shimmerColor;
  final Widget child;
  final bool? enabled;

  /// Create a widget with a [UColors.loadDark] shimmer effect
  ///```dart
  /// UShimmer.dark(
  ///    child: URectContainer(
  ///           height: 20,
  ///           ),
  /// ),
  ///```
  const UShimmer.dark({
    Key? key,
    required this.child,
    this.enabled,
  })  : shimmerColor = ShimmerColor.dark,
        super(key: key);

  /// Create a widget with a [UColors.loadMed] shimmer effect
  /// ```dart
  /// UShimmer.med(
  ///    child: URectContainer(
  ///           height: 20,
  ///           ),
  /// ),
  ///```
  const UShimmer.med({
    Key? key,
    required this.child,
    this.enabled,
  })  : shimmerColor = ShimmerColor.med,
        super(key: key);

  /// Create a widget with a [UColors.loadLight] shimmer effect
  /// ```dart
  /// UShimmer.light(
  ///    child: URectContainer(
  ///           height: 20,
  ///           ),
  /// ),
  ///```
  const UShimmer.light({
    Key? key,
    required this.child,
    this.enabled,
  })  : shimmerColor = ShimmerColor.light,
        super(key: key);

  /// Create a widget with a [UColors.white] shimmer effect
  /// ```dart
  /// UShimmer.white(
  ///    child: URectContainer(
  ///           height: 20,
  ///           ),
  /// ),
  ///```
  const UShimmer.white({
    Key? key,
    required this.child,
    this.enabled,
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
      enabled: enabled ?? true,
    );
  }
}
