import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ULoadingPage extends StatefulWidget {
  const ULoadingPage({Key? key}) : super(key: key);

  static const routeName = '/ULoading';

  @override
  State<ULoadingPage> createState() => _ULoadingPageState();
}

class _ULoadingPageState extends State<ULoadingPage> {
  final _isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return UActionLoading(
      dashLoadingIndicatorPadding: const EdgeInsets.only(
        left: 48,
      ),
      isLoading: _isLoading,
      child: Scaffold(
        backgroundColor: UColors.defGrey,
        appBar: UAppBar.back(
          title: ULoadingPage.routeName.substring(1),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox.square(
                dimension: 16,
              ),
              if (!_isLoading.value) ...[
                const Center(
                  child: UText(
                    'ULoadingIndicator',
                    textStyle: UTextStyle.H1_primaryHeader,
                  ),
                ),
                const SizedBox.square(
                  dimension: 8,
                ),
                const ULoadingIndicator(),
              ],
              const SizedBox.square(
                dimension: 64,
              ),
              const Align(
                alignment: Alignment.center,
                child: UText(
                  'Shaded Page with ULoadingIndicator',
                  textStyle: UTextStyle.H2_secondaryHeader,
                ),
              ),
              Center(
                child: UButton.secondary(
                  label: 'UActionLoading',
                  uIconData: UIcons.link_button,
                  onPressed: () async {
                    _isLoading.value = true;
                    setState(() {});
                    await Future.delayed(const Duration(seconds: 5), () {});
                    _isLoading.value = false;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
