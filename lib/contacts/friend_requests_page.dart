import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_friend_requests.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class FriendRequestPage extends StatelessWidget {
  const FriendRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.friendRequestPage_appBarTitle),
      body: FutureBuilder<List<MockContact>>(
        future: loadingFriendRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final friendRequestsList = snapshot.data!;
            if (friendRequestsList.isEmpty) {
              return const EmptyBody(
                text: UAppStrings.friendRequestPage_emptyBody,
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: UText(
                      UAppStrings.friendRequestPage_received +
                          friendRequestsList.length.toString(),
                      textStyle: UTextStyle.H5_fifthHeader,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: friendRequestsList.length,
                      itemBuilder: (context, index) {
                        final item = friendRequestsList[index];
                        return FriendRequestListTile(
                          name: item.name,
                          statusMessage: item.statusMessage,
                          status: item.status,
                          imageAddress: item.imageAddress,
                          onTap: () {
                            // TODO(yijing): update to user profile page
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
          // TODO(yijing): update indicator
          return const Center(child: ULoadingIndicator());
        },
      ),
    );
  }
}
