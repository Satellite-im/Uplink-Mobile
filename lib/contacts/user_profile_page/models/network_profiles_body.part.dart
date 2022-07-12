import 'package:flutter/material.dart';
import 'package:ui_library/widgets/widgets_export.dart';

class KNetworkProfiles extends StatelessWidget {
  const KNetworkProfiles({
    Key? key,
    required this.networkUsername,
    required this.networkProfile,
  }) : super(key: key);

  final String networkUsername;
  final NetworkProfiles networkProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: UNetworksProfiles(
            networkUsername: networkUsername,
            networkProfile: networkProfile,
          ),
        ),
        const SizedBox.square(
          dimension: 20,
        ),
        const UDivider(),
      ],
    );
  }
}
