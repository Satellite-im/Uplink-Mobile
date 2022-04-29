import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

Map<String, Widget> uFABMap = {
  'UFAB.android': UFAB.android(onPressed: () {}),
  'UFAB.ios': UFAB.ios(onPressed: () {}),
  'UFAB.big': UFAB.big(onPressed: () {}),
};

class UFABPage extends StatelessWidget {
  const UFABPage({Key? key}) : super(key: key);
  static const routeName = '/UFAB';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Container(),
      floatingActionButton: SizedBox(
          height: 300,
          child: ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                final String _key = uFABMap.keys.elementAt(index);
                return Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        uFABMap[_key]!,
                        SizedBox(
                            height: 20,
                            width: 100,
                            child: Center(child: Text(_key)))
                      ],
                    ));
              },
              separatorBuilder: (_, index) => const SizedBox(height: 20),
              itemCount: uFABMap.length)),
    );
  }
}
