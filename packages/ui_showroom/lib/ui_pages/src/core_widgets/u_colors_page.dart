import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

Map<String, Color> colorsMap = {
  'backgroundDark': UColors.backgroundDark,
  'foregroundDark': UColors.foregroundDark,
  'modalDark': UColors.modalDark,
  'white': UColors.white,
  'ctablue': UColors.ctaBlue,
  'ctadark': UColors.ctaDark,
  'onlineGreen': UColors.onlineGreen,
  'idleYellow': UColors.idleYellow,
  'termRed': UColors.termRed,
  'defGrey': UColors.defGrey,
  'textMed': UColors.textMed,
  'textDark': UColors.textDark,
};

class UColorsPage extends StatelessWidget {
  const UColorsPage({Key? key}) : super(key: key);

  static const routeName = '/UColors';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: ListView.separated(
            itemBuilder: ((context, index) {
              final String key = colorsMap.keys.elementAt(index);

              return ColorRow(
                colorName: key,
                uColor: colorsMap[key]!,
              );
            }),
            separatorBuilder: ((context, index) => const SizedBox(
                  height: 8.0,
                )),
            itemCount: colorsMap.length),
      ),
    );
  }
}

class ColorRow extends StatelessWidget {
  const ColorRow({Key? key, required this.colorName, required this.uColor})
      : super(key: key);

  final String colorName;
  final Color uColor;

  @override
  Widget build(BuildContext context) {
    final _uColorCode =
        uColor.toString().replaceAll('Color(', '').replaceAll(')', '');
    return Container(
      color: uColor,
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UText(
              'UColors.$colorName',
              textStyle: UTextStyle.H1_primaryHeader,
              textColor: _uColorCode == '0xffeef0f2'
                  ? UColors.backgroundDark
                  : UColors.white,
            ),
            UText(
              _uColorCode,
              textStyle: UTextStyle.H1_primaryHeader,
              textColor: _uColorCode == '0xffeef0f2'
                  ? UColors.backgroundDark
                  : UColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
