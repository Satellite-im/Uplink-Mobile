import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class ChatIndexPage extends StatefulWidget {
  const ChatIndexPage({Key? key}) : super(key: key);

  @override
  State<ChatIndexPage> createState() => _ChatIndexPageState();
}

class _ChatIndexPageState extends State<ChatIndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.search,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.menu_bar_notifications,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
          IconButton(
            icon: const UIcon(
              UIcons.compose_message_button,
              color: UColors.textMed,
            ),
            onPressed: () async {},
          ),
        ],
        leading: IconButton(
          icon: const UIcon(
            UIcons.lefthand_navigation_drawer,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
        title: UAppStrings.chatIndexPage_appBarTitle,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _FavoritesList(),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const UText(
                      'Start a Conversation',
                      textStyle: UTextStyle.H1_primaryHeader,
                      textColor: UColors.textMed,
                    ),
                    const SizedBox.square(
                      dimension: 16,
                    ),
                    const Center(
                      child: UText(
                        'Sed ut perspiciatis unde omnis iste natus error '
                        'sit voluptatem accusantium doloremque laudantium.',
                        textStyle: UTextStyle.B1_body,
                        textColor: UColors.white,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox.square(
                      dimension: 56,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: UButton.primary(
                        label: 'Add a Friend',
                        uIconData: UIcons.add_contact_member,
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoritesList extends StatelessWidget {
  const _FavoritesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 17,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: UText(
              'Favorites',
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.textMed,
            ),
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          const _NewChatButton(),
        ],
      ),
    );
  }
}

class _NewChatButton extends StatelessWidget {
  const _NewChatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        children: [
          UIconButton.add(onPressed: () {}),
          const SizedBox.square(
            dimension: 8,
          ),
          const UText(
            'New Chat',
            textStyle: UTextStyle.M1_micro,
            textColor: UColors.white,
          ),
        ],
      ),
    );
  }
}
