import 'package:bloc_101/errors/exceptions.dart';
import 'package:bloc_101/errors/failure.dart';
import 'package:bloc_101/features/users/data/models/user.dart';
import 'package:bloc_101/network/dio_config.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();

  Future<UserModel> getUser();
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient;

  const UserRemoteDataSourceImpl(this._dioClient);

  @override
  Future<UserModel> getUser() {
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final results = await _dioClient.get('users');

      return results['data']
          .map<UserModel>((json) => UserModel.fromJson(json))
          .asList();
    } catch (e) {
      rethrow;
    }
  }
}
