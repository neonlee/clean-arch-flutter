import 'package:flutter_clean_arch/account/data/data_source/create_account_remote_data_source.dart';
import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';
import 'package:flutter_clean_arch/core/network/dio_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CreateAccountRemoteDataSource createAccountRemoteDataSource;

  setUp(() {
    DioClient dioClient = DioClient('url');
    createAccountRemoteDataSource =
        CreateAccountRemoteDataSourceImpl(dioClient);
  });
  test('dale', () async {
    const CreateAccountEntity createAccountEntity = CreateAccountEntity(
      email: 'anderson1231@teste132.com',
      username: 'clean_arch1121323',
      password: '123',
      acceptedTerms: true,
    );
    var response = await createAccountRemoteDataSource
        .createAccountRemoteDataSource(createAccountEntity);
    expect(createAccountEntity, response);
  });
}
