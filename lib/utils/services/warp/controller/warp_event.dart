part of 'warp_bloc.dart';

@immutable
abstract class WarpEvent {
  List<Object> get props => [];
}

class WarpStarted extends WarpEvent {
  WarpStarted(this.pin);

  final String pin;
  @override
  List<Object> get props => [];
}

class WarpReseted extends WarpEvent {
  WarpReseted();
}
