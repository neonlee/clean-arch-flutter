import 'package:either_dart/either.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';
import 'package:flutter_clean_arch/account/domain/repositories/create_account_repository.dart';
import 'package:flutter_clean_arch/core/errors/feilures.dart';
import 'package:flutter_clean_arch/core/usecases/dio_usecases.dart';

class CreateAccountUseCase extends UseCase<CreateAccountEntity, Params> {
  final CreateAccountRepository createAccountRepository;
  CreateAccountUseCase(this.createAccountRepository);
  @override
  Future<Either<Failure, CreateAccountEntity>> call(params) async {
    return await createAccountRepository
        .postCreateAccount(params.createAccountEntity);
  }
}

class Params extends Equatable {
  final CreateAccountEntity createAccountEntity;

  const Params({required this.createAccountEntity});

  @override
  List<Object?> get props => [createAccountEntity];
}
