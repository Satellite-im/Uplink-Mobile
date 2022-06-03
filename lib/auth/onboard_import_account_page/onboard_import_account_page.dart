import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_import_account_page/models/selected_seeds_grid_view.dart';
import 'package:uplink/auth/onboard_import_account_page/models/text_field_with_associative_seeds.dart';
import 'package:uplink/l10n/main_app_strings.dart';
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

  /// Determine whether the keyboard is hidden.
  Future<bool> get keyboardHidden async {
    // If the embedded value at the bottom of the window is not greater than 0, // the keyboard is not displayed.
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
    // Used to obtain the change of the window size to determine whether
    // the keyboard is hidden.
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    // stop Observing the window size changes.
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    // When the window insets changes, the method will be called by the system, // where we can judge whether the keyboard is hidden.
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
                  UAppStrings.onboardImportAccountPage_error,
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.termRed,
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 24),
//Recovery Button
              Opacity(
                opacity: selectionFinished ? 1 : 0.5,
                child: UButton.primary(
                  label: isWrongSeeds
                      ? UAppStrings.onboardImportAccountPage_tryAgain
                      : UAppStrings.onboardImportAccountPage_recover,
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
