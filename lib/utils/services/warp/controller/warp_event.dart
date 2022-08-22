part of 'warp_bloc.dart';

@immutable
abstract class WarpEvent {
  List<Object> get props => [];
}

class EnableWarp extends WarpEvent {
  EnableWarp(this.passphrase);

  final String passphrase;
  @override
  List<Object> get props => [];
}

class DropMultipass extends WarpEvent {
  DropMultipass();

  @override
  List<Object> get props => [];
}

class GetUserDID extends WarpEvent {
  @override
  List<Object> get props => [];
}
