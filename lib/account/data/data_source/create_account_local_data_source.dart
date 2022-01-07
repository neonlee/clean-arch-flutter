import 'package:flutter_clean_arch/account/data/models/create_account_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CreateAccountLocalDataSource {
  Future<CreateAccountModel> cacheCreateAccountDataSource(
      CreateAccountModel createAccountModel);
}

const String cache = 'CACHED_CREATE_ACCOUNT';

class CreateAccountLocalDataSourceImpl extends CreateAccountLocalDataSource {
  final SharedPreferences sharedPreferences;

  CreateAccountLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<CreateAccountModel> cacheCreateAccountDataSource(
      CreateAccountModel createAccountModel) {
    throw UnimplementedError();
  }
}
