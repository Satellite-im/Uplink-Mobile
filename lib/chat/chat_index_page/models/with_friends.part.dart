part of '../chat_index_page.dart';

class _WithFriends extends StatelessWidget {
  const _WithFriends({
    Key? key,
    required this.friendsList,
  }) : super(key: key);

  final List<UnreadMessagesUserProfileCard> friendsList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: friendsList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox.square(
          dimension: 20,
        ),
        itemCount: friendsList.length,
      ),
    );
  }
}
