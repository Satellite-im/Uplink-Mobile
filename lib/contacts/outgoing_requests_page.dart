import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class OutgoingRequestPage extends StatefulWidget {
  const OutgoingRequestPage({Key? key}) : super(key: key);

  @override
  State<OutgoingRequestPage> createState() => _OutgoingRequestPageState();
}

class _OutgoingRequestPageState extends State<OutgoingRequestPage> {
  final _friendController = GetIt.I.get<FriendBloc>();

  @override
  void initState() {
    _friendController.add(ListOutgoingFriendRequestsStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.outgoingRequestPage_appBarTitle),
      body: BlocBuilder<FriendBloc, FriendState>(
        bloc: _friendController,
        builder: (context, state) {
          if (state is FriendLoadSuccess &&
              _friendController.outgoingFriendRequestsList.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MiniTitleWithNum(
                  title: UAppStrings.outgoingRequestPage_sent,
                  num: _friendController.outgoingFriendRequestsList.length,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        _friendController.outgoingFriendRequestsList.length,
                    itemBuilder: (context, index) {
                      final item =
                          _friendController.outgoingFriendRequestsList[index];
                      return OutgoingRequestListTile(
                        user: item.user,
                        onTap: () {
                          // TODO(yijing): update to user profile page
                        },
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is FriendLoadInProgress) {
            return const Center(child: ULoadingIndicator());
          } else {
            return const EmptyBody(
              text: UAppStrings.outgoingRequestPage_emptyBody,
            );
          }
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
        UAppStrings.outgoingRequestPage_emptyBody,
        textStyle: UTextStyle.B1_body,
        textColor: UColors.white,
      ),
    );
  }
}
