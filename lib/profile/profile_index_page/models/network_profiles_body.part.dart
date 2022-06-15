part of '../profile_index_page.dart';

class _NetworkProfiles extends StatelessWidget {
  const _NetworkProfiles({
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UNetworksProfiles(
                networkUsername: networkUsername,
                networkProfile: networkProfile,
              ),
              USwitcher(
                switchValue: true,
                onSwitch: (value) {},
              ),
            ],
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
