import 'package:bloc_101/errors/failure.dart';
import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:bloc_101/features/users/domain/repositories/user_repository.dart';
import 'package:bloc_101/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

class GetUsersUseCase implements UseCase<List<UserEntity>, NoParams> {
  final UserRepository _userRepository;

  GetUsersUseCase(this._userRepository);

  @override
  Future<Either<Failure, List<UserEntity>?>> call(NoParams params) async {
    return await _userRepository.getUsers();
  }
}
