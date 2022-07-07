import 'package:bloc_101/errors/failure.dart';
import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:bloc_101/features/users/domain/repositories/user_repository.dart';
import 'package:bloc_101/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUseCase implements UseCase<UserEntity, IdParams> {
  final UserRepository _userRepository;

  GetUserUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserEntity?>> call(IdParams params) async {
    return await _userRepository.getUser(params.id);
  }
}
