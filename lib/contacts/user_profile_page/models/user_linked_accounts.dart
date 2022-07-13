import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UserLinkedAccounts extends StatelessWidget {
  const UserLinkedAccounts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO(yijing): add linked public account
    // List<Map<NetworkProfiles, String>> linkedPublicAccountsList = [
    //   {NetworkProfiles.spotify: 'username12'},
    //   {NetworkProfiles.twitch: 'username_plays'},
    // ];
    // return ListView.separated(
    //     itemBuilder: (context, index) => Text('111'),
    //     separatorBuilder: (context, index) => UDivider(),
    //     itemCount: linkedPublicAccountsList.length);
    return Column(
      children: const [
        UDivider(),
        KNetworkProfiles(
          networkProfile: NetworkProfiles.spotify,
          networkUsername: 'username12',
        ),
        SizedBox.square(
          dimension: 20,
        ),
        KNetworkProfiles(
          networkProfile: NetworkProfiles.twitch,
          networkUsername: 'username_plays',
        ),
        SizedBox.square(
          dimension: 20,
        ),
      ],
    );
  }
}

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
