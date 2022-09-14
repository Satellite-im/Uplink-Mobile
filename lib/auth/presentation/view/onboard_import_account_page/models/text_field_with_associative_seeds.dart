import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/view/onboard_import_account_page/models/bip39.dart';
import 'package:uplink/auth/presentation/view/onboard_import_account_page/models/suggested_seed_overlay.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class TextFieldWithAssociativeSeeds extends StatefulWidget {
  const TextFieldWithAssociativeSeeds({
    Key? key,
    required this.addInSelectedGridView,
  }) : super(key: key);

  final Function(String passphrase) addInSelectedGridView;

  @override
  State<TextFieldWithAssociativeSeeds> createState() =>
      _TextFieldWithAssociativeSeedsState();
}

class _TextFieldWithAssociativeSeedsState
    extends State<TextFieldWithAssociativeSeeds> {
  OverlayEntry? overlayEntry;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  List<String> suggestedPassphraseList = [];
  final layerLink = LayerLink();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() => FocusScope.of(context).requestFocus(focusNode));
    suggestedPassphraseList.addAll(bip39Dic);
  }

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    overlayEntry?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: layerLink,
      child: UTextInput.singleLine(
        controller: controller,
        hintText: UAppStrings.onboardImportAccountPage_hint,
        autofocus: true,
        focusNode: focusNode,
        onChanged: (word) {
          //update suggestedPassphraseList to update the suggestion memu
          searchPassphrass(controller.text.toLowerCase());
        },
        onSubmitted: (passphrase) {
          final value = passphrase.toLowerCase();
          if (bip39Dic.contains(value)) {
            widget.addInSelectedGridView(passphrase);
            controller.clear();
            suggestedPassphraseList.clear();
          } else {
            controller.clear();
            suggestedPassphraseList.clear();
          }
        },
      ),
    );
  }

  void searchPassphrass(String query) {
    final _tempDicList = <String>[...bip39Dic];

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
      suggestedPassphraseList
        ..clear()
        ..addAll(_tempSuggestList);
    } else {
      suggestedPassphraseList.clear();
    }
    showOverlay();
  }

  void showOverlay() {
    final overlay = Overlay.of(context);
    final width = MediaQuery.of(context).size.width - 32;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: const Offset(0, 68),
          child: SuggestedSeedsOverlay(
            suggestedPassphraseList: suggestedPassphraseList,
            onTap: (passphrase) {
              widget.addInSelectedGridView(passphrase);
              //delete the texts in text field
              controller.clear();
              suggestedPassphraseList.clear();
              //close suggested passphrase list
              overlayEntry?.remove();
            },
          ),
        ),
      ),
    );
    overlay?.insert(overlayEntry!);
  }
}
