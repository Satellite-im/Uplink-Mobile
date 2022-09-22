// ignore_for_file: use_late_for_private_fields_and_variables

part of 'warp_bloc.dart';

@immutable
abstract class WarpState extends Equatable {}

class WarpInitial extends WarpState {
  @override
  List<Object?> get props => [];
}

class WarpLoadInProgress extends WarpState {
  @override
  List<Object?> get props => [];
}

class WarpLoadSuccess extends WarpState {
  @override
  List<Object?> get props => [];
}

class WarpLoadFailure extends WarpState {
  @override
  List<Object?> get props => [];
}

class RaygunLoadInProgress extends WarpState {
  @override
  List<Object?> get props => [];
}

class RaygunLoadSuccess extends WarpState {
  @override
  List<Object?> get props => [];
}

class RaygunLoadFailure extends WarpState {
  @override
  List<Object?> get props => [];
}
