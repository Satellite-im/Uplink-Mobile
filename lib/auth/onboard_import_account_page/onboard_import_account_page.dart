// ignore_for_file: lines_longer_than_80_chars, prefer_final_locals

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_import_account_page/models/seed_text_field.dart';
import 'package:uplink/linking_satelittes_page.dart';

class OnboardImportAccountPage extends StatefulWidget {
  const OnboardImportAccountPage({Key? key}) : super(key: key);

  @override
  State<OnboardImportAccountPage> createState() =>
      _OnboardImportAccountPageState();
}

class _OnboardImportAccountPageState extends State<OnboardImportAccountPage> {
  List<String> selectedPassphraseList = [];
  // List<String> suggestedPassphraseList = [];
  // int? tapedWordIndex; //the index for taped word in suggestedPassphraseList
  String query = ''; //query value from the text field

  bool selectionFinished = false;
  bool isWrongSeeds = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
              SeedTextField(
                selectedPassphraseList: selectedPassphraseList,
                selectionFinished: selectionFinished,
              ),
              // Container(
              //   height: 48,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(4),
              //     color: UColors.foregroundDark,
              //   ),
              //   padding: const EdgeInsets.symmetric(horizontal: 16),
              //   child: TextField(
              //     autofocus: true,
              //     focusNode: focusNode,
              //     autocorrect: false,
              //     controller: controller,
              //     cursorColor: Colors.white,
              //     style: UTextStyle.H5_fifthHeader.style
              //         .returnTextStyleType()
              //         .copyWith(color: Colors.white),
              //     decoration: InputDecoration(
              //       border: InputBorder.none,
              //       hintText: 'Enter Passphrase',
              //       hintStyle: UTextStyle.H5_fifthHeader.style
              //           .returnTextStyleType()
              //           .copyWith(color: UColors.textDark),
              //     ),
              //     textInputAction: TextInputAction.newline,
              //     onChanged: (word) {
              //       //update suggestedPassphraseList to update the suggestion memu
              //       searchPassphrass(controller.text.toLowerCase());
              //     },
              //     onSubmitted: (passphrase) {
              //       addInSelectedWordGridView(
              //         passphrase: passphrase,
              //         fromTextField: true,
              //       );
              //     },
              //   ),
              // ),
              const SizedBox(height: 8),
//suggested list
              // if (suggestedPassphraseList.isNotEmpty &&
              //     showSuggestedWordsGridView)
              //   ConstrainedBox(
              //     constraints: const BoxConstraints(
              //       maxHeight: 230, //240
              //     ),
              //     child: ListView.builder(
              //       //Changing the size by its content
              //       shrinkWrap: true,
              //       physics: const ClampingScrollPhysics(),
              //       itemCount: suggestedPassphraseList.length,
              //       itemBuilder: (context, index) {
              //         final passphrase = suggestedPassphraseList[index];
              //         var highlight = false;
              //         if (tapedWordIndex == index) highlight = true;
              //         return InkWell(
              //           child: Container(
              //             color: highlight
              //                 ? UColors.ctaBlue
              //                 : UColors.foregroundDark,
              //             height: 48,
              //             padding: const EdgeInsets.symmetric(
              //               horizontal: 16,
              //               vertical: 16,
              //             ),
              //             child: UText(
              //               passphrase,
              //               textStyle: UTextStyle.BUT1_primaryButton,
              //             ),
              //           ),
              //           onTap: () {
              //             setState(() {
              //               tapedWordIndex = index;
              //               addInSelectedWordGridView(
              //                 passphrase: passphrase,
              //                 fromTextField: false,
              //               );
              //             });
              //           },
              //         );
              //       },
              //     ),
              //   )
              // else
              //   const SizedBox(),
              const SizedBox(height: 24),
//Selected words grid view
              CustomScrollView(
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
                            isWrongSeeds = false; //remove erorr text
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),

              if (isWrongSeeds == true) const SizedBox(height: 24),
              if (isWrongSeeds == true)
                const UText(
                  'error. account not registered',
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.termRed,
                  textAlign: TextAlign.center,
                ),
//Button to recovery account
              const SizedBox(height: 24),
              Opacity(
                opacity: selectionFinished ? 1 : 0.5,
                child: UButton.primary(
                  label: isWrongSeeds ? 'Try Again' : 'Recover Account',
                  uIconData: isWrongSeeds
                      ? UIcons.refresh_try_again
                      : UIcons.add_contact_member,
                  onPressed: () {
                    if (selectedPassphraseList.length == 12) {
                      // TODO(yijing): update to bip39 validation
                      if (selectedPassphraseList
                          .every((element) => element == 'about')) {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) => const LinkingSatellitesPage(),
                          ),
                        );
                      } else {
                        setState(() {
                          isWrongSeeds = true;
                        });
                        // show error messsge
                        // change the button icon and text
                      }
                    }
                  },
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
