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
      child: SizedBox(
        height: _appAvatarSize.size,
        width: _appAvatarSize.size,
        child: Image.asset(
          'packages/ui_library/images/placeholders/app_avatar.png',
        ),
      ),
    );
  }
}
