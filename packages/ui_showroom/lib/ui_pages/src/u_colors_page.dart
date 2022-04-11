import 'package:flutter/material.dart';
import 'package:ui_library/core/u_colors/u_colors.dart';

Map<String, Color> colorsMap = {
  'dark': UColors.dark,
  'fgdark': UColors.fgdark,
  'mddark': UColors.mddark,
  'ctablue': UColors.ctablue,
  'ctadark': UColors.ctadark,
};

class UColorsPage extends StatelessWidget {
  const UColorsPage({Key? key}) : super(key: key);

  static const routeName = '/UColors';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)), //here will show 'UColor'
      ),
      body: ListView.separated(
          itemBuilder: ((context, index) {
            final String key = colorsMap.keys.elementAt(index);
            return ColorRow(
              colorName: key,
              uColor: colorsMap[key]!,
            );
          }),
          separatorBuilder: ((context, index) => const SizedBox(
                height: 10,
              )),
          itemCount: colorsMap.length),
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
    return Stack(alignment: Alignment.center, children: [
      Container(
        color: uColor,
        width: 200,
        height: 100,
      ),
      Text(
        'UColors.$colorName',
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
    ]);
  }
}
