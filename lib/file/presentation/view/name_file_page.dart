import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class NameFilePage extends StatefulWidget {
  const NameFilePage({super.key, this.item, this.isRename});

  final Item? item;
  final bool? isRename;

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
      appBar: UAppBar.back(
        title: widget.isRename == true ? 'Rename' : 'Upload File',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: UTextInput.singleLineWithTitle(
          controller: _textEditingController,
          textFieldTitle: 'Name',
          hintText: 'Text Input Field',
          onSubmitted: (fileName) {
            if (fileName.length > 2) {
              if (widget.isRename == true) {
                _showConfirmBottomSheet(context, _fileName).show();
              } else {
                Navigator.of(context).pop(fileName);
              }
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
              if (widget.isRename == true) {
                _showConfirmBottomSheet(context, _fileName).show();
              } else {
                Navigator.of(context).pop(_fileName);
              }
            }
          },
          uIconData: UIcons.checkmark_1,
        ),
      ),
    );
  }

  UBottomSheetTwoButtons _showConfirmBottomSheet(
    BuildContext context,
    String fileName,
  ) {
    return UBottomSheetTwoButtons(
      context,
      firstButtonOnPressed: () {
        Navigator.of(context).pop();
      },
      secondButtonOnPressed: () {
        Navigator.of(context)
          ..pop()
          ..pop(fileName);
      },
      header: 'Do you want to save your changes?',
      firstButtonText: UAppStrings.cancelButton,
      secondButtonText: 'Save',
    );
  }
}
