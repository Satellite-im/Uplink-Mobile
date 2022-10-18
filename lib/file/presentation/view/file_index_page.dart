import 'package:flutter/material.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';

class FileIndexPage extends StatelessWidget {
  const FileIndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: FileIndexAppbar(),
      ),
      body: FileIndexBody.itemList(),
    );
  }
}
