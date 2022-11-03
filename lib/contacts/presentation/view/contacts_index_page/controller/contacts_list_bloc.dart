import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:uplink/contacts/data/repositories/friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'contacts_list_event.dart';
part 'contacts_list_state.dart';

class ContactsListBloc extends Bloc<ContactsListEvent, ContactsListState> {
  ContactsListBloc(this._friendRepository) : super(ContactsListInitial()) {
    on<GetContactsList>((event, emit) async {
      emit(ContactsListLoadInProgress());

      try {
        final _contactsList = await _friendRepository.listFriends();
        emit(ContactsListLoadSuccess(_contactsList));
      } catch (e) {
        addError('ContactsListBloc -> GetContactsList Error:$e');
        emit(ContactsLoadFailure());
      }
    });
    on<RemoveContact>((event, emit) async {
      try {
        emit(ContactsListLoadInProgress());
        _friendRepository.removeFriend(event.user.did!);
        final _contactsList = await _friendRepository.listFriends();
        emit(ContactsListLoadSuccess(_contactsList));
      } catch (error) {
        addError(error);
        emit(ContactsLoadFailure());
      }
    });
  }

  final IFriendRepository _friendRepository;
}
