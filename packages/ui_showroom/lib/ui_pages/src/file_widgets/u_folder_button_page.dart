import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> uFolderButtonList = const [
  UFolderButton(name: 'Folder name', itemNum: 0),
  UFolderButton(
    name: 'Folder name',
    itemNum: 1,
    isLinked: true,
  ),
  UFolderButton(
    name: 'Folder name',
    itemNum: 2,
    isFavored: true,
  ),
  UFolderButton(
    name: 'Folder name',
    itemNum: 3,
    isDeleting: true,
  ),
  UFolderButton(
    name: 'Folder name',
    itemNum: 3,
    isLinked: true,
    isFavored: true,
    isDeleting: true,
  ),
];

class UFolderButtonPage extends StatelessWidget {
  const UFolderButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UFolderButton';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: ListView.separated(
            itemBuilder: (_, index) => Center(child: uFolderButtonList[index]),
            separatorBuilder: (_, index) => const SizedBox(height: 10),
            itemCount: uFolderButtonList.length),
      ),
    );
  }
}
