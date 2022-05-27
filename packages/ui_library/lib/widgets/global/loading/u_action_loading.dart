import 'package:flutter/material.dart';

import '../../../core/const/const_export.dart';
import 'u_loading_indicator.dart';

class UActionLoading extends StatelessWidget {
  const UActionLoading({
    Key? key,
    required this.child,
    required this.dashLoadingIndicatorPadding,
    required this.isLoading,
  }) : super(key: key);

  final Widget child;
  final ValueNotifier<bool> isLoading;
  final EdgeInsets dashLoadingIndicatorPadding;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        _ShadedPageWithLoadingDash(
          isLoading: isLoading,
          dashLoadingIndicatorPadding: dashLoadingIndicatorPadding,
        ),
      ],
    );
  }
}

class _ShadedPageWithLoadingDash extends StatefulWidget {
  const _ShadedPageWithLoadingDash({
    Key? key,
    required this.isLoading,
    required this.dashLoadingIndicatorPadding,
  }) : super(key: key);

  final ValueNotifier<bool> isLoading;
  final EdgeInsets dashLoadingIndicatorPadding;

  @override
  State<_ShadedPageWithLoadingDash> createState() =>
      _ShadedPageWithLoadingDashState();
}

class _ShadedPageWithLoadingDashState
    extends State<_ShadedPageWithLoadingDash> {
  @override
  void initState() {
    widget.isLoading.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    widget.isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isLoading.value
        ? Container(
            decoration: BoxDecoration(
              color: UColors.backgroundDark.withOpacity(0.6),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ULoadingIndicator(
                padding: widget.dashLoadingIndicatorPadding,
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}
