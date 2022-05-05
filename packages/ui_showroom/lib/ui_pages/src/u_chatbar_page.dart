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
              child: Container(
                height: 56,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  children: [
                    UIconButton.add(onPressed: () => _sendMsg('sticker')),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(16, 8, 7, 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: UColors.foregroundDark),
                        child: Row(
                          children: [
                            Expanded(
                                child: TextField(
                              textInputAction: TextInputAction.newline,
                              controller: _textEditingController,
                              cursorColor: UColors.textDark,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Speak Freely...',
                                  //TO DO: extract Text Style to UTextStyle
                                  hintStyle: TextStyle(
                                    fontFamily: UFonts.textPoppinsFont,
                                    fontWeight: FontWeight.w400,
                                    //may need to be changed
                                    fontSize: 10,
                                    color: UColors.textDark,
                                  )),
                              onSubmitted: _sendMsg,
                            )),
                            InkWell(
                              onTap: () => _sendMsg('sticker'),
                              child: const UIcon(
                                UIcons.chatbar_stickers,
                                color: UColors.textDark,
                              ),
                            ),
                            const SizedBox(width: 17),
                            InkWell(
                              onTap: () => _sendMsg('gifs'),
                              child: const UIcon(
                                UIcons.chatbar_gifs,
                                color: UColors.textDark,
                              ),
                            ),
                            const SizedBox(width: 17),
                            InkWell(
                              onTap: () => _sendMsg('emojis'),
                              child: const UIcon(
                                UIcons.chatbar_emojis,
                                color: UColors.textDark,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _sendMsg(String value) {
    setState(() {
      _textList.add(value);
      _textEditingController.clear();
    });
  }
}
