import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';

class NameFilePage extends StatefulWidget {
  const NameFilePage({super.key, this.item});

  final Item? item;

  @override
  State<NameFilePage> createState() => _NameFilePageState();
}

class _NameFilePageState extends State<NameFilePage> {
  bool _isFABLight = false;
  late String _fileName;
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.item?.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: 'Upload File'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UTextInput.singleLineWithTitle(
          controller: _textEditingController,
          textFieldTitle: 'Name',
          hintText: 'Text Input Field',
          onSubmitted: (fileName) {
            if (fileName.length > 2) {
              Navigator.of(context).pop(fileName);
            }
          },
          onChanged: (value) {
            setState(() {
              if (value.length > 2) {
                _fileName = value;
                _isFABLight = true;
              } else {
                _isFABLight = false;
              }
            });
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
