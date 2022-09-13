part of 'current_user_bloc.dart';

@immutable
abstract class CurrentUserState extends Equatable {
  @override
  List<Object> get props => [];
}

class CurrentUserInitial extends CurrentUserState {}

class CurrentUserLoadInProgress extends CurrentUserState {}

class CurrentUserLoadSuccess extends CurrentUserState {
  CurrentUserLoadSuccess(this.currentUser);

  final CurrentUser currentUser;

  @override
  List<Object> get props => [currentUser];
}

class CurrentUserLoadFailure extends CurrentUserState {
  CurrentUserLoadFailure(this.message);
  final String message;
}
