import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class SuggestedSeedsOverlay extends StatefulWidget {
  const SuggestedSeedsOverlay({
    Key? key,
    required this.suggestedPassphraseList,
    required this.onTap,
  }) : super(key: key);

  final List<String> suggestedPassphraseList;
  final Function(String passphrase) onTap;
  @override
  State<SuggestedSeedsOverlay> createState() => SuggestedSeedsOverlayState();
}

class SuggestedSeedsOverlayState extends State<SuggestedSeedsOverlay> {
  int? tapedWordIndex;
  @override
  Widget build(BuildContext context) {
    if (widget.suggestedPassphraseList.isNotEmpty) {
      return Material(
        borderRadius: BorderRadius.circular(4),
        clipBehavior: Clip.hardEdge,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 230),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: widget.suggestedPassphraseList.length,
            itemBuilder: (context, index) {
              final passphrase = widget.suggestedPassphraseList[index];
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
                    widget.onTap(widget.suggestedPassphraseList[index]);
                  });
                },
              );
            },
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
