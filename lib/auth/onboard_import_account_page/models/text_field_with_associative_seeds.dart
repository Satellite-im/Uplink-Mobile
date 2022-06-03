import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_import_account_page/models/bip39.dart';
import 'package:uplink/auth/onboard_import_account_page/models/suggested_seed_overlay.dart';

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

//显示overlay
  void showOverlay() {
    final overlay = Overlay.of(context);
    // ignore: cast_nullable_to_non_nullable
    final renderbox = context.findRenderObject as RenderBox;
    final size = renderbox.size;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: Offset(0, size.height + 8),
          child: SuggestedSeedsOverlay(
            suggestedPassphraseList: suggestedPassphraseList,
            onTap: widget.addInSelectedGridView,
          ),
        ),
      ),
    );
    overlay?.insert(overlayEntry!);
  }
}
