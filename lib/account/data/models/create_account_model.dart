import 'package:flutter_clean_arch/account/domain/entities/create_account_entity.dart';

class CreateAccountModel extends CreateAccountEntity {
  const CreateAccountModel({
    required String email,
    required String username,
    String? password,
  }) : super(
          email: email,
          username: username,
          acceptedTerms: true,
          password: password,
        );

  factory CreateAccountModel.fromJson(Map<String, dynamic> json) {
    return CreateAccountModel(
      email: json['email'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'email': email,
      'acceptedTerms': acceptedTerms,
      'password': password,
    };
  }

  CreateAccountEntity toCreateAccountEntity() => CreateAccountEntity(
        email: email,
        username: username,
        acceptedTerms: acceptedTerms,
        password: password,
      );
}
