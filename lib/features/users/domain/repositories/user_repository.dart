import 'package:bloc_101/errors/failure.dart';
import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<UserEntity>>> getUsers();

  Future<Either<Failure, UserEntity>> getUser({required int id});
}
