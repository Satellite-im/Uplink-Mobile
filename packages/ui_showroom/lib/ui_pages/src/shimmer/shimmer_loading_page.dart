import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_showroom/ui_pages/src/shimmer/loading_pages/loading_pages_export.dart';

class ShimmerLoadingPage extends StatefulWidget {
  const ShimmerLoadingPage({Key? key}) : super(key: key);
  static const routeName = '/Shimmer loading pages';

  @override
  State<ShimmerLoadingPage> createState() => _ShimmerLoadingPageState();
}

class _ShimmerLoadingPageState extends State<ShimmerLoadingPage> {
  Widget _body = const LoadingContactsIndexPage();
  String dropdownValue = 'Loading ContactsIndexPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const UIcon(UIcons.back_arrow),
          ),
          const SizedBox(width: 50),
          DropdownButton(
            value: dropdownValue,
            items: <String>[
              'Loading ContactsIndexPage',
              'Loading ChatIndexPage',
              'Loading ProfileIndexPage',
              'Four'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              Widget currentBody = Center(child: Text(newValue!));
              if (newValue == 'Loading ContactsIndexPage') {
                currentBody = const LoadingContactsIndexPage();
              } else if (newValue == 'Loading ChatIndexPage') {
                currentBody = const LoadingChatIndexPage();
              } else if (newValue == 'Loading ProfileIndexPage') {
                currentBody = const LoadingProfileIndexPage();
              }
              setState(() {
                _body = currentBody;
                dropdownValue = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
