part of '../profile_index_page.dart';

class _ProfileIndexBody extends StatelessWidget {
  const _ProfileIndexBody({
    Key? key,
    required Size pageSize,
    required this.controller,
    required Function(bool) onTapEditProfile,
  })  : _pageSize = pageSize,
        _onTapEditProfile = onTapEditProfile,
        super(key: key);

  final Size _pageSize;
  final CurrentUserBloc controller;
  final Function(bool) _onTapEditProfile;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const SizedBox.square(
            dimension: 20,
          ),
          BlocBuilder<CurrentUserBloc, CurrentUserState>(
            bloc: controller,
            builder: (context, state) {
              if (state is CurrentUserLoadSuccess) {
                return UText(
                  state.currentUser.username,
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              } else if (state is CurrentUserLoadFailure) {
                return const UText(
                  'It was not possible to load the username',
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              } else {
                return const UText(
                  'Loading...',
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              }
            },
          ),
          const SizedBox.square(
            dimension: 2,
          ),
          BlocBuilder<CurrentUserBloc, CurrentUserState>(
            bloc: controller,
            builder: (context, state) {
              if (state is CurrentUserLoadSuccess) {
                return UText(
                  state.currentUser.statusMessage ?? '',
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              } else if (state is CurrentUserLoadFailure) {
                return const UText(
                  'It was not possible to load the message status',
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              } else {
                return const UText(
                  'Loading...',
                  textStyle: UTextStyle.H2_secondaryHeader,
                );
              }
            },
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          SizedBox(
            width: _pageSize.width - 32,
            child: UButton.primary(
              label: UAppStrings.profileIndexPage_editProfile,
              uIconData: UIcons.compose_message,
              onPressed: () {
                _onTapEditProfile(true);
              },
            ),
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          _ProfileData(
            controller: controller,
          ),
          const SizedBox.square(
            dimension: 24,
          ),
          const UDivider(),
          const SizedBox.square(
            dimension: 19,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Row(
              children: const [
                UIcon(
                  UIcons.about,
                  color: UColors.textMed,
                ),
                SizedBox.square(
                  dimension: 8,
                ),
                UText(
                  UAppStrings.profileIndexPage_aboutTitle,
                  textStyle: UTextStyle.H3_tertiaryHeader,
                ),
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 18,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: UText(
              controller.currentUser?.about ?? '',
              textStyle: UTextStyle.B1_body,
              textColor: UColors.white,
            ),
          ),
          const SizedBox.square(
            dimension: 24,
          ),
          const UDivider(),
          const SizedBox.square(
            dimension: 21,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                UText(
                  UAppStrings.profileIndexPage_setStatus,
                  textStyle: UTextStyle.H5_fifthHeader,
                ),
                UStatusText(
                  status: Status.online,
                )
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          const UDivider(),
          const SizedBox.square(
            dimension: 20,
          ),
          const _NetworkProfiles(
            networkProfile: NetworkProfiles.spotify,
            networkUsername: 'username12',
          ),
          const SizedBox.square(
            dimension: 20,
          ),
          const _NetworkProfiles(
            networkProfile: NetworkProfiles.twitch,
            networkUsername: 'username_plays',
          ),
          const SizedBox.square(
            dimension: 20,
          ),
        ],
      ),
    );
  }
}
