import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_outgoing_requests.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class OutgoingRequestPage extends StatelessWidget {
  const OutgoingRequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.outgoingRequestPage_appBarTitle),
      body: FutureBuilder<List<MockContact>>(
        future: loadingOutgoingRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final friendRequestsList = snapshot.data!;

            if (friendRequestsList.isEmpty) {
              return const EmptyBody(
                text: UAppStrings.outgoingRequestPage_emptyBody,
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MiniTitleWithNum(
                    title: UAppStrings.outgoingRequestPage_sent,
                    num: friendRequestsList.length,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: friendRequestsList.length,
                      itemBuilder: (context, index) {
                        final item = friendRequestsList[index];
                        return OutgoingRequestListTile(
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
          // TODO(yijing): update to standard indicator
          return const Center(child: ULoadingIndicator());
        },
      ),
    );
  }
}

class NoOutgoingRequestBody extends StatelessWidget {
  const NoOutgoingRequestBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: UText(
        'No one is here, you have 0 outgoing request!',
        textStyle: UTextStyle.B1_body,
        textColor: UColors.white,
      ),
    );
  }
}
