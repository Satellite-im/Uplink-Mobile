import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UChatbarPage extends StatefulWidget {
  const UChatbarPage({Key? key}) : super(key: key);
  static const routeName = '/UChatbar';

  @override
  State<UChatbarPage> createState() => _UChatbarPageState();
}

class _UChatbarPageState extends State<UChatbarPage> {
  final _textEditingController = TextEditingController();

  final List<String> _textList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UChatbarPage.routeName.substring(1)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemBuilder: (context, index) {
                return Text(_textList[index]);
              },
              itemCount: _textList.length,
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: UChatbar(
                textEditingController: _textEditingController,
                onMsg: (value) {
                  _addValue(value);
                },
                onImage: () {
                  _addValue('image');
                },
                onSticker: () {
                  _addValue('sticker');
                },
                onEmoji: () {
                  _addValue('emoji');
                },
                onGif: () {
                  _addValue('gif');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _addValue(String value) {
    setState(() {
      _textList.add(value);
    });
  }
}
