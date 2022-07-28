import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

List<Widget> _uTextInputList = [
  UTextInput.singleLine(hintText: 'Text Input Field', onChanged: (value) {}),
  UTextInput.singleLineWithTitle(
    textFieldTitle: 'Title',
    hintText: 'Text Input Field',
    onChanged: (value) {},
  ),
  UTextInput.multiLines(hintText: 'Text Input Field', onChanged: (value) {}),
  UTextInput.multiLinesWithTitle(
    textFieldTitle: 'Title',
    hintText: 'Text Input Field',
    onChanged: (value) {},
  ),
];

List<String> _nameList = [
  'UTextInput.singleLine',
  'UTextInput.singleLineWithTitle',
  'UTextInput.multiLines',
  'UTextInput.multiLinesWithTitle'
];

class UTextInputPage extends StatelessWidget {
  const UTextInputPage({Key? key}) : super(key: key);
  static const routeName = '/UTextInput';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UTextInputPage.routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.separated(
            itemBuilder: (_, index) => Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(_nameList[index]),
                    const SizedBox(height: 5),
                    _uTextInputList[index]
                  ],
                ),
            separatorBuilder: (_, index) => const SizedBox(
                  height: 40,
                  child: UDivider(),
                ),
            itemCount: _uTextInputList.length),
      ),
    );
  }
}
