part of '../profile_index_page.dart';

class _ProfileIndexHeader extends StatelessWidget {
  const _ProfileIndexHeader({
    Key? key,
    required this.pageSize,
  }) : super(key: key);

  final Size pageSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox.square(
          dimension: 114,
        ),
        UUserPictureChange(
          showChangeImageButton: false,
          onPictureSelected: (value) {},
        ),
        const SizedBox.square(
          dimension: 20,
        ),
        const UText(
          UAppStrings.profileIndexPage_username,
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
        const SizedBox.square(
          dimension: 2,
        ),
        const UText(
          UAppStrings.profileIndexPage_statusMessage,
          textStyle: UTextStyle.B1_body,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        SizedBox(
          width: pageSize.width - 32,
          child: UButton.primary(
            label: UAppStrings.profileIndexPage_editProfile,
            uIconData: UIcons.compose_message_button,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
