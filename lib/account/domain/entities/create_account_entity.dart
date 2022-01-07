import 'package:equatable/equatable.dart';

class CreateAccountEntity extends Equatable {
  final String email;
  final String username;
  final String? password;
  final bool acceptedTerms;

  const CreateAccountEntity(
      {required this.email,
      required this.username,
      this.password,
      required this.acceptedTerms});

  @override
  List<Object?> get props => [username, email, password, acceptedTerms];
}
