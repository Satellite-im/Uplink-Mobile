import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum NetworkProfiles { spotify, twitch }

extension _NetworkLogoPath on NetworkProfiles {
  String get _logoPath {
    switch (this) {
      case NetworkProfiles.spotify:
        return 'packages/ui_library/images/networks_logo/spotify_logo.png';
      case NetworkProfiles.twitch:
        return 'packages/ui_library/images/networks_logo/twitch_logo.png';
    }
  }
}

class UNetworksProfiles extends StatelessWidget {
  /// Creates a row with a Network Profile picture and [UText]
  const UNetworksProfiles({
    Key? key,
    required String networkUsername,
    required NetworkProfiles networkProfile,
  })  : _networkProfile = networkProfile,
        _networkUsername = networkUsername,
        super(key: key);

  final NetworkProfiles _networkProfile;
  final String _networkUsername;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          _networkProfile._logoPath,
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
