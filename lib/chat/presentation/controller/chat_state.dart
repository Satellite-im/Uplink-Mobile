// ignore_for_file: use_late_for_private_fields_and_variables

part of 'chat_bloc.dart';

@immutable
abstract class ChatState {
  List<Object> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoadInProgress extends ChatState {
  ChatLoadInProgress(this.chatMessages);

  final List<UChatMessage> chatMessages;
  @override
  List<Object> get props => [chatMessages];
}

class ChatLoadSucces extends ChatState {
  ChatLoadSucces(this.chatMessages);

  final List<UChatMessage> chatMessages;
  @override
  List<Object> get props => [chatMessages];
}

class AllChatsLoadSuccess extends ChatState {
  AllChatsLoadSuccess(this.allChatMessages);

  final List<ChatWithUser> allChatMessages;
  @override
  List<Object> get props => [allChatMessages];
}

class ChatLoadError extends ChatState {
  @override
  List<Object> get props => [];
}
