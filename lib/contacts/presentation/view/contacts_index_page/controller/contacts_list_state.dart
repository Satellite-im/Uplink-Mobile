// ignore_for_file: must_be_immutable

part of 'contacts_list_bloc.dart';

@immutable
abstract class ContactsListState extends Equatable {
  late List<User> contactsList;
  @override
  List<Object> get props => contactsList;
}

class ContactsListInitial extends ContactsListState {}

class ContactsListLoadInProgress extends ContactsListState {}

class ContactsListLoadSuccess extends ContactsListState {
  ContactsListLoadSuccess(this.newContactsList);
  final List<User> newContactsList;
  @override
  List<User> get contactsList => newContactsList;
}

class ContactsLoadFailure extends ContactsListState {}
