part of '../chat_index_page.dart';

class _WithoutFriendsYet extends StatelessWidget {
  const _WithoutFriendsYet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
