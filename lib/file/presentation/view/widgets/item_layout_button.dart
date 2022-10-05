import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ItemLayoutButton extends StatelessWidget {
  const ItemLayoutButton({
    Key? key,
    required this.onPressed,
    required this.isSelected,
    required this.uIconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isSelected;
  final UIconData uIconData;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? UColors.ctaDark : UColors.backgroundDark,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: UIcon(
            uIconData,
            color: isSelected ? UColors.white : UColors.textMed,
          ),
        ),
      ),
    );
  }
}
