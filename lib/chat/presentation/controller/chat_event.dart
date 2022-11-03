part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {
  List<Object> get props => [];
}

class WatchAllConversations extends ChatEvent {
  @override
  List<Object> get props => [];
}

class GetNewMessageFromUserStarted extends ChatEvent {
  @override
  List<Object> get props => [];
}

class CreateConversationStarted extends ChatEvent {
  CreateConversationStarted(this.user);

  final User user;
  @override
  List<Object> get props => [];
}

class SendNewMessageStarted extends ChatEvent {
  SendNewMessageStarted(this.newMessageSent);

  final String newMessageSent;
  @override
  List<Object> get props => [newMessageSent];
}
