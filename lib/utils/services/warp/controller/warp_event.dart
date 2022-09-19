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

class RaygunStarted extends WarpEvent {
  RaygunStarted();

  @override
  List<Object> get props => [];
}

class WarpLogout extends WarpEvent {
  WarpLogout();
}
