import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UserLinkedAccount extends StatelessWidget {
  const UserLinkedAccount({
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
        const SizedBox.square(
          dimension: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
