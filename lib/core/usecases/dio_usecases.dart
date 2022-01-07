import 'package:either_dart/either.dart';
import 'package:flutter_clean_arch/core/errors/feilures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
