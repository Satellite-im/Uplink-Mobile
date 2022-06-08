import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/app/view/app.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/loading_page.dart';

class ChatIndexPage extends StatefulWidget {
  const ChatIndexPage({Key? key}) : super(key: key);

  @override
  State<ChatIndexPage> createState() => _ChatIndexPageState();
}

class _ChatIndexPageState extends State<ChatIndexPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      //TODO(yijing): update to sign in Future function
      future: Future<bool>.delayed(
        const Duration(seconds: 2),
        () => true,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChatIndexBody();
        }
        return const LoadingPage(
          title: UAppStrings.linkingSatellitesPage_title,
          body: UAppStrings.linkingSatellitesPage_subTitle,
        );
      },
    );
  }
}

class ChatIndexBody extends StatefulWidget {
  const ChatIndexBody({Key? key}) : super(key: key);

  @override
  State<ChatIndexBody> createState() => _ChatIndexBodyState();
}

class _ChatIndexBodyState extends State<ChatIndexBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat index'),
        actions: [
          //Logout button for demonstration
          IconButton(
            onPressed: () {
              // TODO(yijing): update user log out function
              _setLogout();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute<void>(builder: (context) => const App()),
                (route) => false,
              );
            },
            icon: const UIcon(UIcons.settings_logout),
          )
        ],
      ),
    );
  }
}

Future<void> _setLogout() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isUserLogged', false);
}
