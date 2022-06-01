// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_import_account_page/models/seed_text_field.dart';
import 'package:uplink/auth/onboard_import_account_page/models/selected_seeds_grid_view.dart';
import 'package:uplink/linking_satelittes_page.dart';

class OnboardImportAccountPage extends StatefulWidget {
  const OnboardImportAccountPage({Key? key}) : super(key: key);

  @override
  State<OnboardImportAccountPage> createState() =>
      _OnboardImportAccountPageState();
}

class _OnboardImportAccountPageState extends State<OnboardImportAccountPage>
    with WidgetsBindingObserver {
  List<String> selectedPassphraseList = [];
  bool selectionFinished = false;
  bool isWrongSeeds = false;
  late List<String> bip39Dic;

  void addInSelectedWordGridView({
    required String passphrase,
  }) {
    final value = passphrase.toLowerCase();
    if (bip39Dic.contains(value)) {
      if (selectedPassphraseList.length < 12) {
        setState(
          () {
            selectedPassphraseList.add(value);
            if (selectedPassphraseList.length == 12) {
              selectionFinished = true;
            }
          },
        );
      }
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

  /// Determine whether the keyboard is hidden.
  Future<bool> get keyboardHidden async {
    // If the embedded value at the bottom of the window is not greater than 0, the keyboard is not displayed.
    bool check() =>
        (WidgetsBinding.instance?.window.viewInsets.bottom ?? 0) <= 0;
    // If the keyboard is displayed, return the result directly.
    if (!check()) return false;
    // If the keyboard is hidden, in order to cope with the misjudgment caused by the keyboard display/hidden animation process, wait for 0.1 seconds and then check again and return the result.
    return Future.delayed(const Duration(milliseconds: 100), check);
  }

  @override
  void initState() {
    super.initState();
    // Used to obtain the change of the window size to determine whether the keyboard is hidden.
    WidgetsBinding.instance?.addObserver(this);
    _loadBip39().then((value) {
      setState(() {
        bip39Dic = value;
      });
    });
  }

  @override
  void dispose() {
    // stop Observing the window size changes.
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // When the window insets changes, the method will be called by the system, where we can judge whether the keyboard is hidden.
    // If the keyboard is hidden, unfocus to end editing.
    keyboardHidden.then(
      (value) => value ? FocusManager.instance.primaryFocus?.unfocus() : null,
    );
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
              SeedTextField(
                bip39Dic: bip39Dic,
                addInSelectedGridView: (passphrase) =>
                    addInSelectedWordGridView(passphrase: passphrase),
              ),
              const SizedBox(height: 8),
              const SizedBox(height: 24),
//Selected seeds grid view
              SelectedSeedsGridView(
                selectedPassphraseList: selectedPassphraseList,
                cancelSelectionFinished: () => setState(() {
                  selectionFinished = false;
                }),
                cancelWrongSeed: () => setState(() {
                  isWrongSeeds = false;
                }),
              ),
//Error message
              if (isWrongSeeds == true) const SizedBox(height: 24),
              if (isWrongSeeds == true)
                const UText(
                  'error. account not registered',
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.termRed,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 24),
//Recovery Button
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
