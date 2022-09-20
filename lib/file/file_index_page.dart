// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/widgets/widgets_export.dart';

class FileIndexPage extends StatefulWidget {
  const FileIndexPage({Key? key}) : super(key: key);

  @override
  State<FileIndexPage> createState() => _FileIndexPageState();
}

class _FileIndexPageState extends State<FileIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, kToolbarHeight),
        child: FileIndexAppbar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: Row(
                children: [
                  UText('No item', textStyle: UTextStyle.H5_fifthHeader),
                  Expanded(child: SizedBox.shrink()),
                  IconButton(
                    onPressed: () {},
                    icon: UIcon(UIcons.grid_view),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: UIcon(UIcons.list_view),
                  ),
                ],
              ),
            ),
            Expanded(child: NoItemBody())
          ],
        ),
      ),
    );
  }
}
