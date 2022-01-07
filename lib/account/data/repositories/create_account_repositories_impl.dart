import 'package:either_dart/either.dart';
import 'package:flutter_clean_arch/account/data/data_source/create_account_local_data_source.dart';
import 'package:flutter_clean_arch/account/data/data_source/create_account_remote_data_source.dart';
import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';
import 'package:flutter_clean_arch/account/domain/repositories/create_account_repository.dart';
import 'package:flutter_clean_arch/core/errors/feilures.dart';

class CreateAccountRepositoriesImpl extends CreateAccountRepository {
  final CreateAccountRemoteDataSource remoteDataSource;
  final CreateAccountLocalDataSource localDataSource;

  CreateAccountRepositoriesImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  Future<Either<Failure, CreateAccountEntity>> postCreateAccount(
      CreateAccountEntity createAccountEntity) async {
    final createAccount = await remoteDataSource
        .createAccountRemoteDataSource(createAccountEntity);
    //localDataSource.cacheCreateAccountDataSource(createAccount);
    return Right(createAccount);
  }
}
