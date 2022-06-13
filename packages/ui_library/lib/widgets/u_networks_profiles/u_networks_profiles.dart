import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _NetworkLogo { spotify, twitch }

extension _NetworkLogoPath on _NetworkLogo {
  String get _path {
    switch (this) {
      case _NetworkLogo.spotify:
        return 'packages/ui_library/images/networks_logo/spotify_logo.png';
      case _NetworkLogo.twitch:
        return 'packages/ui_library/images/networks_logo/twitch_logo.png';
    }
  }
}

class UNetworksProfiles extends StatelessWidget {
  const UNetworksProfiles.spotifyProfile({
    Key? key,
    required String spotifyUsername,
  })  : _networkLogo = _NetworkLogo.spotify,
        _networkUsername = spotifyUsername,
        super(key: key);

  const UNetworksProfiles.twitchProfile({
    Key? key,
    required String twitchUsername,
  })  : _networkLogo = _NetworkLogo.twitch,
        _networkUsername = twitchUsername,
        super(key: key);

  final _NetworkLogo _networkLogo;
  final String _networkUsername;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          _networkLogo._path,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UText(
          _networkUsername,
          textStyle: UTextStyle.B1_body,
          textColor: UColors.white,
        )
      ],
    );
  }
}
