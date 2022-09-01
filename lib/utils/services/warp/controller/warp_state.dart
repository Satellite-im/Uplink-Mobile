// ignore_for_file: use_late_for_private_fields_and_variables

part of 'warp_bloc.dart';

@immutable
abstract class WarpState {}

class WarpInitial extends WarpState {}

class WarpLoadInProgress extends WarpState {}

class WarpLoadSuccess extends WarpState {}

class WarpLoadFailure extends WarpState {}
