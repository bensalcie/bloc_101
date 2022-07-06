import 'package:bloc/bloc.dart';
import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:bloc_101/features/users/domain/usecases/get_users_usecase.dart';
import 'package:bloc_101/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'users_event.dart';
part 'users_state.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  final GetUsersUseCase _getUsersUseCase;

  UsersBloc(this._getUsersUseCase) : super(UsersInitial()) {
    on<GetUsersEvent>(_getUsers);
    on<UsersRefreshEvent>(_getUsers);
  }

  void _getUsers(UsersEvent event, Emitter<UsersState> emit) async {
    emit(UsersLoading());
    final result = await _getUsersUseCase(NoParams());

    emit(
      result.fold(
        (l) => UsersErrored(error: l.toString()),
        (r) => UsersLoaded(users: r),
      ),
    );
  }

  void _refresh(UsersEvent event, Emitter<UsersState> emit) {
    emit(UsersRefreshing());
    Future.delayed(const Duration(seconds: 20), () {
      _getUsers(event, emit);
    });
  }
}
