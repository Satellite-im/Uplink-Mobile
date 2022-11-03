part of 'contacts_list_bloc.dart';

@immutable
abstract class ContactsListEvent extends Equatable {
  const ContactsListEvent();
  @override
  List<Object?> get props => [];
}

class GetContactsList extends ContactsListEvent {}

class RemoveContact extends ContactsListEvent {
  const RemoveContact(this.user);

  final User user;

  @override
  List<Object> get props => [];
}
