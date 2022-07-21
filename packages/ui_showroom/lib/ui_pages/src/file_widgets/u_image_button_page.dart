import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> uImageButtonList = const [
  UImageButton(
    uImage: UImage(),
    isDeleting: true,
    isFavored: true,
    isLinked: true,
  ),
  UImageButton(
    uImage: UImage(),
    isFavored: true,
  ),
  UImageButton(
    uImage: UImage(),
    isLinked: true,
  ),
  UImageButton(
    uImage: UImage(),
    isDeleting: true,
  ),
];

class UImageButtonPage extends StatelessWidget {
  const UImageButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UImageButton';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView.separated(
            itemBuilder: (_, index) => Center(child: uImageButtonList[index]),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: uImageButtonList.length),
      ),
    );
  }
}
