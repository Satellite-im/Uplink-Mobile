import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> uButtonList = [
  UButton.primary(
    label: 'UButton.primary',
    uIconData: UIcons.about,
    onPressed: () {},
  ),
  UButton.secondary(
    label: 'UButton.secondary',
    uIconData: UIcons.about,
    onPressed: () {},
  ),
  UButton.filled1(
    label: 'UButton.filled1',
    onPressed: () {},
  ),
  UButton.filled2(
    label: 'UButton.filled2',
    onPressed: () {},
  ),
  UButton.primary(
    label: 'UButton.primary',
    uIconData: UIcons.about,
    onPressed: () {},
    disabled: true,
  ),
  UButton.secondary(
    label: 'UButton.secondary',
    uIconData: UIcons.about,
    onPressed: () {},
    disabled: true,
  ),
  UButton.filled1(
    label: 'UButton.filled1',
    onPressed: () {},
    disabled: true,
  ),
  UButton.filled2(
    label: 'UButton.filled2',
    onPressed: () {},
    disabled: true,
  ),
];

class UButtonPage extends StatelessWidget {
  const UButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UButton';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) => Center(child: uButtonList[index]),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: uButtonList.length),
      ),
    );
  }
}
