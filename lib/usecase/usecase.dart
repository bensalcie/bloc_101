import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

// base usecase from whcih all usecases will
// implement call method.
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type?>> call(Params params);
}

// Pass this when the usecase expects no parameters
// e.g a call to get a list of shows
class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class IdParams extends Equatable {
  final int id;

  const IdParams({required this.id});

  @override
  List<Object?> get props => [id];
}

class FlagParams extends Equatable {
  final bool flag;

  const FlagParams({required this.flag});

  @override
  List<Object> get props => [flag];
}
