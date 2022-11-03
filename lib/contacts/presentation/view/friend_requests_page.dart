import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class FriendRequestPage extends StatefulWidget {
  const FriendRequestPage({Key? key}) : super(key: key);

  @override
  State<FriendRequestPage> createState() => _FriendRequestPageState();
}

class _FriendRequestPageState extends State<FriendRequestPage> {
  final _friendController = GetIt.I.get<FriendBloc>();

  @override
  void initState() {
    super.initState();
    _friendController.add(ListIncomingFriendRequestsStarted());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.friendRequestPage_appBarTitle),
      body: BlocBuilder<FriendBloc, FriendState>(
        bloc: _friendController,
        builder: (context, state) {
          if (state is FriendLoadSuccess &&
              _friendController.incomingFriendRequestsList.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MiniTitleWithNum(
                  title: UAppStrings.friendRequestPage_received,
                  num: _friendController.incomingFriendRequestsList.length,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:
                        _friendController.incomingFriendRequestsList.length,
                    itemBuilder: (context, index) {
                      final item =
                          _friendController.incomingFriendRequestsList[index];
                      return FriendRequestListTile(
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
              text: UAppStrings.friendRequestPage_emptyBody,
            );
          }
        },
      ),
    );
  }
}
