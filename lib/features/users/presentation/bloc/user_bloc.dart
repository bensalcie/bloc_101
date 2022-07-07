import 'package:bloc/bloc.dart';
import 'package:bloc_101/usecase/usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserUseCase _getUsersUseCase;
  final int userid;

  UserBloc(this._getUsersUseCase, this.userid) : super(UserInitial()) {
    on<GetUserEvent>((event, emit) async {
      emit(UserLoading());
      final user = await _getUsersUseCase.call(IdParams(id: userid));
      emit(user.fold((l) => UserErrored(error: l.toString()),
          (r) => UserLoaded(user: r!)));
    });
  }
}
