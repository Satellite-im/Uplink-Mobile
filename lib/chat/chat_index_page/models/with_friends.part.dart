part of '../chat_index_page.dart';

class _WithFriends extends StatelessWidget {
  const _WithFriends({
    Key? key,
    required this.friendsList,
  }) : super(key: key);

  final List<UnreadMessagesUserProfileCard> friendsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            onTap: () {},
            child: friendsList[index],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox.square(
        dimension: 20,
      ),
      itemCount: friendsList.length,
    );
  }
}
