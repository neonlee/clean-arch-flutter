import 'package:dio/dio.dart';
import 'package:flutter_clean_arch/account/data/models/create_account_model.dart';
import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';
import 'package:flutter_clean_arch/core/network/dio_client.dart';

abstract class CreateAccountRemoteDataSource {
  Future<CreateAccountEntity> createAccountRemoteDataSource(
      CreateAccountEntity createAccountEntity);
}

class CreateAccountRemoteDataSourceImpl extends CreateAccountRemoteDataSource {
  final DioClient client;
  CreateAccountRemoteDataSourceImpl(this.client);
  @override
  Future<CreateAccountEntity> createAccountRemoteDataSource(
      CreateAccountEntity createAccountEntity) async {
    CreateAccountModel createAccountModel = CreateAccountModel(
      username: createAccountEntity.username,
      email: createAccountEntity.email,
      password: createAccountEntity.password,
    );
    late Response response;
    try {
      response = await client.dioClient().post(
            '/users',
            data: createAccountModel.toJson(),
          );
    } catch (err) {
      if (err is DioError) {
        return throw Exception(err.response!.data['error']);
      }
      return throw Exception(err);
    }

    return CreateAccountModel.fromJson(response.data).toCreateAccountEntity();
  }
}
