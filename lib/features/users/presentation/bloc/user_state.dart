part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserLoaded extends UserState {
  final UserEntity user;

  const UserLoaded({required this.user});
  @override
  List<Object> get props => [user];
}

class UserErrored extends UserState {
  final String error;

  const UserErrored({required this.error});
}
