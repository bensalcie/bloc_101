// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/users/data/datasources/remote/user/user_remote_datasource.dart'
    as _i7;
import '../features/users/data/repositories/user/user_repository_impl.dart'
    as _i9;
import '../features/users/domain/repositories/user_repository.dart' as _i8;
import '../features/users/domain/usecases/get_user_usecase.dart' as _i10;
import '../network/dio_config.dart' as _i6;
import '../network/network_info.dart' as _i5;
import 'module_injection.dart' as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModules = _$RegisterModules();
  gh.lazySingleton<_i3.Connectivity>(() => registerModules.connectivity);
  gh.lazySingleton<_i4.Dio>(() => registerModules.dio);
  gh.lazySingleton<_i5.NetworkInfo>(
      () => _i5.NetworkInfoImpl(get<_i3.Connectivity>()));
  gh.factory<String>(() => registerModules.baseUrl, instanceName: 'baseUrl');
  gh.lazySingleton<_i6.DioClient>(() =>
      _i6.DioClient(get<String>(instanceName: 'baseUrl'), get<_i4.Dio>()));
  gh.lazySingleton<_i7.UserRemoteDataSource>(
      () => _i7.UserRemoteDataSourceImpl(get<_i6.DioClient>()));
  gh.lazySingleton<_i8.UserRepository>(
      () => _i9.UserRepositoryImpl(get<_i7.UserRemoteDataSource>()));
  gh.lazySingleton<_i10.GetUserUseCase>(
      () => _i10.GetUserUseCase(get<_i8.UserRepository>()));
  return get;
}

class _$RegisterModules extends _i11.RegisterModules {}
