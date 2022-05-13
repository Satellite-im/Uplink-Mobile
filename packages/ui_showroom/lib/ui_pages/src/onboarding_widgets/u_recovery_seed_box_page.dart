import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class URecoverySeedBoxPage extends StatelessWidget {
  const URecoverySeedBoxPage({Key? key}) : super(key: key);

  static const routeName = '/URecoverySeedBox';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: const [
            _WidgetRow(
              title: 'Recovery Seed Box',
              widgets: [
                URecoverySeedBox(
                  word: 'dog',
                  wordNumber: 1,
                ),
                URecoverySeedBox(
                  word: 'rocket',
                  wordNumber: 2,
                ),
              ],
            ),
            _WidgetRow(
              title: '',
              widgets: [
                URecoverySeedBox(
                  word: 'cell',
                  wordNumber: 3,
                ),
                URecoverySeedBox(
                  word: 'microphone',
                  wordNumber: 4,
                ),
              ],
            ),
            SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class _WidgetRow extends StatelessWidget {
  const _WidgetRow({Key? key, required this.title, required this.widgets})
      : super(key: key);

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgets = [];

    widgets.forEach(((element) {
      _widgets.add(element);
      _widgets.add(const SizedBox.square(dimension: 8));
    }));

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox.square(
          dimension: 8,
        ),
        if (title.isNotEmpty) ...[
          const SizedBox.square(
            dimension: 8,
          ),
          UText(
            title,
            textStyle: UTextStyle.H1_primaryHeader,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _widgets,
        )
      ],
    );
  }
}
