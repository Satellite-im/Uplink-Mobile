import 'dart:async';

import 'package:uplink/contacts/data/repositories/friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class ContactsListStream {
  ContactsListStream(this._friendRepository);

  void start() {
    var _oldContactsList = <User>[];
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) async {
        final _contactsList = await _friendRepository.listFriends();
        if (_oldContactsList.length != _contactsList.length) {
          _controller.sink.add(_contactsList);
          _oldContactsList = _contactsList;
        }
        if (_oldContactsList.isEmpty && _contactsList.isEmpty) {
          _controller.sink.add(<User>[]);
          //make sure stream yield an empty List[] rather than null
        }
      },
    );
  }

  void cancel() {
    _timer?.cancel();
  }

  late Timer? _timer;

  final _controller = StreamController<List<User>>();

  Stream<List<User>> get stream => _controller.stream;
  final IFriendRepository _friendRepository;
}
