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

class ChatLoadError extends ChatState {
  @override
  List<Object> get props => [];
}
