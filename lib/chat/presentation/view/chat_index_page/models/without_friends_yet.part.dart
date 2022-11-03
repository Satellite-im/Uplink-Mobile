part of '../chat_index_page.dart';

class _WithoutFriendsYet extends StatelessWidget {
  const _WithoutFriendsYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox.square(
            dimension: _screenSize.height / 8.5,
          ),
          const UText(
            UAppStrings.chatIndexPage_startConversationTitle,
            textStyle: UTextStyle.H1_primaryHeader,
            textColor: UColors.textMed,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          const Center(
            child: UText(
              UAppStrings.chatIndexPage_startConversationBody,
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
              label: UAppStrings.chatIndexPage_addFriendButton,
              uIconData: UIcons.add_contact,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (context) => const AddFriendPage(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
