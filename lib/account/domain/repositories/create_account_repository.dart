import 'package:either_dart/either.dart';
import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';
import 'package:flutter_clean_arch/core/errors/feilures.dart';

abstract class CreateAccountRepository {
  Future<Either<Failure, CreateAccountEntity>> postCreateAccount(
      CreateAccountEntity createAccountEntity);
}
