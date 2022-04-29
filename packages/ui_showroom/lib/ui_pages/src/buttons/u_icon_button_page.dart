import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

Map<String, Widget> uIconButtonMap = {
  'UIconButton.call': UIconButton.call(onPressed: () {}),
  'UIconButton.end': UIconButton.end(onPressed: () {}),
  'UIconButton.mute': UIconButton.mute(onPressed: () {}),
  'UIconButton.chat': UIconButton.chat(onPressed: () {}),
  'UIconButton.add': UIconButton.add(onPressed: () {}),
  'UIconButton.search': UIconButton.search(onPressed: () {}),
};

class UIconButtonPage extends StatelessWidget {
  const UIconButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UIconButton';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              final String _key = uIconButtonMap.keys.elementAt(index);
              return ListTile(
                contentPadding: EdgeInsets.zero,
                leading: uIconButtonMap[_key],
                title: Text(_key),
              );
            },
            separatorBuilder: (_, index) => const SizedBox(height: 20),
            itemCount: uIconButtonMap.length),
      ),
    );
  }
}
