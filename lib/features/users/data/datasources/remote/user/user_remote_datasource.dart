import 'package:bloc_101/features/users/data/models/user.dart';
import 'package:bloc_101/network/dio_config.dart';
import 'package:bloc_101/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUsers();

  Future<UserModel> getUser({required int id});
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final DioClient _dioClient;

  const UserRemoteDataSourceImpl(this._dioClient);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final results = await _dioClient.get('users');

      return results['data']
          .map<UserModel>((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser({required int id}) async {
    try {
      final results = await _dioClient.get('users/$id');

      return results['data']
          .map<UserModel>((json) => UserModel.fromJson(json))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
