import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> uImageButtonList = const [
  UImageButton.uImage(
    uImage: UImage(),
    isDeleting: true,
    isFavored: true,
    isShared: true,
  ),
  UImageButton.uImage(
    uImage: UImage(),
    isFavored: true,
  ),
  UImageButton.uImage(
    uImage: UImage(),
    isShared: true,
  ),
  UImageButton.uImage(
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
