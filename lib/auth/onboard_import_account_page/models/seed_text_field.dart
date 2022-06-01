import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';

class SeedTextField extends StatefulWidget {
  SeedTextField({
    Key? key,
    required this.selectedPassphraseList,
    required this.selectionFinished,
  }) : super(key: key);

  final List<String> selectedPassphraseList;
  bool selectionFinished;

  @override
  State<SeedTextField> createState() => _SeedTextFieldState();
}

class _SeedTextFieldState extends State<SeedTextField> {
  OverlayEntry? overlayEntry;
  late List<String> _bip39Dic;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  bool showSuggestedWords = false;
  List<String> suggestedPassphraseList = [];
  // List<String> selectedPassphraseList = [];
  int? tapedWordIndex;
  // bool selectionFinished = false;
  final layerLink = LayerLink();
  //用来连接textfield和suggest word

  @override
  void initState() {
    super.initState();
    _loadBip39().then((value) {
      _bip39Dic = value;
      suggestedPassphraseList.addAll(_bip39Dic);
    });
    // WidgetsBinding.instance!.addPostFrameCallback((_) => showOverlay());

    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        showOverlay();
      } else {
        overlayEntry?.remove();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: UColors.foregroundDark,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: TextField(
          autofocus: true,
          focusNode: focusNode,
          autocorrect: false,
          controller: controller,
          cursorColor: Colors.white,
          style: UTextStyle.H5_fifthHeader.style
              .returnTextStyleType()
              .copyWith(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Passphrase',
            hintStyle: UTextStyle.H5_fifthHeader.style
                .returnTextStyleType()
                .copyWith(color: UColors.textDark),
          ),
          textInputAction: TextInputAction.newline,
          onChanged: (word) {
            //update suggestedPassphraseList to update the suggestion memu
            searchPassphrass(controller.text.toLowerCase());
          },
          onSubmitted: (passphrase) {
            addInSelectedWordGridView(
              passphrase: passphrase,
              fromTextField: true,
            );
          },
        ),
      ),
    );
  }

  void searchPassphrass(String query) {
    final _tempDicList = <String>[..._bip39Dic];

    if (query.isNotEmpty) {
      final _tempSuggestList = <String>[];
      //add any word start with [query] into _tempSuggestList
      for (final passPhrase in _tempDicList) {
        if (passPhrase.toLowerCase().startsWith(query)) {
          _tempSuggestList.add(passPhrase);
        }
      }

      //clear previous suggestedPassphraseList
      //update it with new suggestedPassphraseList
      setState(() {
        suggestedPassphraseList
          ..clear()
          ..addAll(_tempSuggestList);
      });
    } else {
      //when the text from the textfield is null
      //clear previous suggestedPassphraseList list
      //add all bip39 words
      setState(() {
        suggestedPassphraseList
          ..clear()
          ..addAll(_tempDicList);
      });
    }
  }

  Future<List<String>> _loadBip39() async {
    final wordsList = <String>[];
    await rootBundle.loadString('assets/bip39_english.txt').then((word) {
      for (final value in const LineSplitter().convert(word)) {
        wordsList.add(value);
      }
    });
    return wordsList;
  }

  void addInSelectedWordGridView({
    required String passphrase,
    required bool fromTextField,
  }) {
    if (_bip39Dic.contains(passphrase)) {
      if (widget.selectedPassphraseList.length < 12) {
        //list hasn't full
        setState(() {
          widget.selectedPassphraseList.add(passphrase);
          if (widget.selectedPassphraseList.length == 12) {
            widget.selectionFinished = true;
          }
          if (fromTextField == true) {
            controller.clear();
            suggestedPassphraseList
              ..clear()
              ..addAll(_bip39Dic);
            focusNode.requestFocus();
          }
        });
      } else {
        // TODO(yijing): list is full
      }
    }
  }

  void showOverlay() {
    final overlay = Overlay.of(context)!;
    final renderbox = context.findRenderObject! as RenderBox;
    final size = renderbox.size;
    // final offset = renderbox.localToGlobal(Offset.zero);
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          offset: Offset(0, size.height + 8),
          child: buildOverlay(),
        ),
      ),
    );
    overlay.insert(overlayEntry!);
  }

  Widget buildOverlay() {
    // if (suggestedPassphraseList.isNotEmpty && showSuggestedWords) {
    if (suggestedPassphraseList.isNotEmpty) {
      return Material(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 230),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            //Changing the size by its content
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: suggestedPassphraseList.length,
            itemBuilder: (context, index) {
              final passphrase = suggestedPassphraseList[index];
              var highlight = false;
              if (tapedWordIndex == index) highlight = true;
              return InkWell(
                child: Container(
                  color: highlight ? UColors.ctaBlue : UColors.foregroundDark,
                  height: 48,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: UText(
                    passphrase,
                    textStyle: UTextStyle.BUT1_primaryButton,
                  ),
                ),
                onTap: () {
                  setState(() {
                    tapedWordIndex = index;
                    addInSelectedWordGridView(
                      passphrase: passphrase,
                      fromTextField: false,
                    );
                  });
                },
              );
            },
          ),
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
