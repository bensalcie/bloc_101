part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersRefreshing extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserEntity> users;

  const UsersLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class UsersErrored extends UsersState {
  final String error;

  const UsersErrored({required this.error});

  @override
  List<Object> get props => [error];
}
