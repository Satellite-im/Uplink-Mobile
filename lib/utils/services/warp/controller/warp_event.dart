part of 'warp_bloc.dart';

@immutable
abstract class WarpEvent {
  List<Object> get props => [];
}

class WarpStarted extends WarpEvent {
  WarpStarted(this.passphrase);

  final String passphrase;
  @override
  List<Object> get props => [];
}

class WarpDropMultipass extends WarpEvent {
  WarpDropMultipass();

  @override
  List<Object> get props => [];
}

// class WarpGetUserDID extends WarpEvent {
//   @override
//   List<Object> get props => [];
// }
