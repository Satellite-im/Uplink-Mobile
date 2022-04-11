import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

Map<String, Color> colorsMap = {
  'dark': UColors.bgDark,
  'fgdark': UColors.fgDark,
  'mddark': UColors.mdDark,
  'ctablue': UColors.ctaBlue,
  'ctadark': UColors.ctaDark,
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
    return Container(
      color: uColor,
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'UColors.$colorName',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              uColor.toString().replaceAll('Color(', '').replaceAll(')', ''),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
