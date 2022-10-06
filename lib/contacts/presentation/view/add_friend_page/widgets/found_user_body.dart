// ignore_for_file: lines_longer_than_80_chars, no_default_cases

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/add_friend_page/widgets/widgets_export.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FoundUserBody extends StatelessWidget {
  const FoundUserBody({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final _friendController = GetIt.I.get<FriendBloc>();
    return BlocBuilder<FriendBloc, FriendState>(
      bloc: GetIt.I.get<FriendBloc>(),
      builder: (context, state) {
        if (state is FriendLoadSuccess && _friendController.user != null) {
          switch (_friendController.user!.relationship) {
            case Relationship.block:
              return BlockedBody(user: _friendController.user!);
            case Relationship.friend:
              return FriendBody(user: _friendController.user!);
            case Relationship.receivedFriendRequest:
            case Relationship.sentFriendRequest:
              return WithFriendRequestBody(user: _friendController.user!);
            case Relationship.none:
            default:
              return WithoutFriendRequestBody(user: _friendController.user!);
          }
        }
        return BlockedBody(user: _friendController.user!);
      },
    );
  }
}
