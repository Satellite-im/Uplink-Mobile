import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class NameFilePage extends StatefulWidget {
  const NameFilePage({super.key});

  @override
  State<NameFilePage> createState() => _NameFilePageState();
}

class _NameFilePageState extends State<NameFilePage> {
  bool _isFABLight = false;
  late String _fileName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: 'Upload File'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UTextInput.singleLineWithTitle(
          textFieldTitle: 'Name',
          hintText: 'Text Input Field',
          onSubmitted: (fileName) {
            if (fileName.length > 2) {
              Navigator.of(context).pop(fileName);
            }
          },
          onChanged: (value) {
            if (value.length > 2) {
              setState(() {
                _fileName = value;
                _isFABLight = true;
              });
            } else {
              setState(() {
                _isFABLight = false;
              });
            }
          },
        ),
      ),
      floatingActionButton: Opacity(
        opacity: _isFABLight ? 1 : 0.5,
        child: UFAB.large(
          onPressed: () {
            if (_isFABLight) {
              Navigator.of(context).pop(_fileName);
            }
          },
          uIconData: UIcons.checkmark_1,
        ),
      ),
    );
  }
}
