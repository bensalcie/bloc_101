import 'package:bloc_101/errors/exceptions.dart';
import 'package:bloc_101/features/users/data/datasources/remote/user/user_remote_datasource.dart';
import 'package:bloc_101/features/users/domain/entities/user.dart';
import 'package:bloc_101/errors/failure.dart';
import 'package:bloc_101/features/users/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<Failure, UserEntity>> getUser({required int id}) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final users = await _userRemoteDataSource.getUsers();
      return Right(users);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
