import 'package:flutter_clean_arch/account/domain/usecases/create_account_use_case.dart';
import 'package:mobx/mobx.dart';

part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  final CreateAccountUseCase createAccountUseCase;
  _SignupStoreBase({required this.createAccountUseCase});
  @action
  Future<void> registerUser({
    required String name,
    required String password,
    required String email,
  }) async {}
}
