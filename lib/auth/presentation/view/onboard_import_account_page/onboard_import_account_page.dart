import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/view/onboard_import_account_page/models/selected_seeds_grid_view.dart';
import 'package:uplink/auth/presentation/view/onboard_import_account_page/models/text_field_with_associative_seeds.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/utils_export.dart';

class OnboardImportAccountPage extends StatefulWidget {
  const OnboardImportAccountPage({Key? key}) : super(key: key);

  @override
  State<OnboardImportAccountPage> createState() =>
      _OnboardImportAccountPageState();
}

class _OnboardImportAccountPageState extends State<OnboardImportAccountPage> {
  List<String> selectedPassphraseList = [];
  bool selectionFinished = false;
  bool isWrongSeeds = false;

  void addInSelectedWordGridView({
    required String passphrase,
  }) {
    if (selectedPassphraseList.length < 12) {
      setState(
        () {
          selectedPassphraseList.add(passphrase);
          if (selectedPassphraseList.length == 12) {
            selectionFinished = true;
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: UAppBar.back(
        title: UAppStrings.onboardImportAccountPage_title,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UText(
                UAppStrings.onboardImportAccountPage_body,
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox(height: 16),
//TextField with suggested seeds menu
              TextFieldWithAssociativeSeeds(
                addInSelectedGridView: (passphrase) =>
                    addInSelectedWordGridView(passphrase: passphrase),
              ),
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
              if (isWrongSeeds == true) ...[
                const SizedBox(height: 24),
                const UText(
                  UAppStrings.onboardImportAccountPage_error,
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.termRed,
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 56),
//Recovery Button
              Opacity(
                opacity: selectionFinished ? 1 : 0.5,
                child: UButton.primary(
                  label: isWrongSeeds
                      ? UAppStrings.onboardImportAccountPage_tryAgain
                      : UAppStrings.onboardImportAccountPage_recover,
                  uIconData: isWrongSeeds ? UIcons.refresh : UIcons.add_contact,
                  onPressed: () async {
                    if (selectedPassphraseList.length == 12) {
                      // TODO(yijing): update to bip39 validation
                      if (selectedPassphraseList
                          .every((element) => element == 'about')) {
                        // TODO(yijing): update user log in state
                        await ULocalStorageService()
                            .saveBoolValue(
                              localKey: ULocalKey.isUserLogged,
                              value: true,
                            )
                            .then(
                              (_) => Navigator.of(context).push(
                                MaterialPageRoute<void>(
                                  builder: (context) =>
                                      const MainBottomNavigationBar(),
                                ),
                              ),
                            );
                      } else {
                        setState(() {
                          isWrongSeeds = true;
                        });
                      }
                    }
                  },
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
