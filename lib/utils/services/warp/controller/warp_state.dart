// ignore_for_file: use_late_for_private_fields_and_variables

part of 'warp_bloc.dart';

@immutable
abstract class WarpState {}

class WarpStateInitial extends WarpState {}

class WarpStateLoading extends WarpState {}

class WarpStateSuccess extends WarpState {}

class WarpStateError extends WarpState {}
