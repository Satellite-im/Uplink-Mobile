part of '../u_app_avatar_profile.dart';

class _AppAvatarNormal extends StatelessWidget {
  const _AppAvatarNormal({
    Key? key,
    required UAvatarProfileSize size,
  })  : _appAvatarSize = size,
        super(key: key);

  final UAvatarProfileSize _appAvatarSize;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: _appAvatarSize.size,
        height: _appAvatarSize.size,
        decoration: const BoxDecoration(
          color: UColors.foregroundDark,
          shape: BoxShape.circle,
        ),
        child: const Padding(
          padding: EdgeInsets.all(4.0),
          child: UPlaceholder.avatarProfile(),
        ),
      ),
    );
  }
}
