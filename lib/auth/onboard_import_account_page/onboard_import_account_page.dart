// ignore_for_file: lines_longer_than_80_chars, prefer_final_locals

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';

class OnboardImportAccountPage extends StatefulWidget {
  const OnboardImportAccountPage({Key? key}) : super(key: key);

  @override
  State<OnboardImportAccountPage> createState() =>
      _OnboardImportAccountPageState();
}

class _OnboardImportAccountPageState extends State<OnboardImportAccountPage> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  late List<String> _bip39Dic;
  List<String> selectedPassphraseList = [];
  List<String> suggestedPassphraseList = [];
  int? tapedWordIndex; //the index for taped word in suggestedPassphraseList
  String query = ''; //query value from the text field
  bool showSuggestedWordsGridView = false;
  bool selectionFinished = false;

  @override
  void initState() {
    super.initState();
    _loadBip39().then((value) {
      _bip39Dic = value;
      suggestedPassphraseList.addAll(_bip39Dic);
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          showSuggestedWordsGridView = true;
        });
      } else {
        setState(() {
          showSuggestedWordsGridView = false;
        });
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UAppBar.back(
        title: 'Import Account',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UText(
                'Enter your 12 word passphrase in exactly the same order your recovery seed was generated.',
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox(height: 16),
//TextField
              Container(
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
              const SizedBox(height: 8),
//suggested list
              if (suggestedPassphraseList.isNotEmpty &&
                  showSuggestedWordsGridView)
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxHeight: 230, //240
                  ),
                  child: ListView.builder(
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
                          color: highlight
                              ? UColors.ctaBlue
                              : UColors.foregroundDark,
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
                )
              else
                const SizedBox(),
              const SizedBox(height: 24),
//Selected words grid view
              Expanded(
                // TODO(yijing):try to refactor with recovery seed page
                child: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  slivers: [
                    SliverGrid.count(
                      crossAxisCount: 2,
                      childAspectRatio: 160 / 40,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: List.generate(
                        selectedPassphraseList.length,
                        (index) => URecoverySeedBox(
                          word: selectedPassphraseList[index],
                          wordNumber: index + 1,
                          onDelete: () {
                            setState(() {
                              if (selectedPassphraseList.length == 12) {
                                selectionFinished = false;
                              }
                              selectedPassphraseList.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
//Button to recovery account
              // const SizedBox(height: 56),
              Opacity(
                opacity: selectionFinished ? 1 : 0.5,
                child: UButton.primary(
                  label: 'Recover Account',
                  uIconData: UIcons.add_contact_member,
                  onPressed: () {
                    if (suggestedPassphraseList.length == 12) {
                      // TODO(yijing): add recovery code validation
                    } else {}
                  },
                ),
              ),
              // Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<String>> _loadBip39() async {
    var wordsList = <String>[];
    await rootBundle.loadString('assets/bip39_english.txt').then((word) {
      for (final value in const LineSplitter().convert(word)) {
        wordsList.add(value);
      }
    });
    return wordsList;
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

  void addInSelectedWordGridView({
    required String passphrase,
    required bool fromTextField,
  }) {
    if (_bip39Dic.contains(passphrase)) {
      if (selectedPassphraseList.length < 12) {
        //list hasn't full
        setState(() {
          selectedPassphraseList.add(passphrase);
          if (selectedPassphraseList.length == 12) selectionFinished = true;
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
}
