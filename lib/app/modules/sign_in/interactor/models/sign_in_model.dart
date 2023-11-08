import 'package:authenticator/app/core/value_objects/password.dart';

class SignInModel {
  final String user;
  final Password password;

  bool get isValid {
    return user.isNotEmpty && password.isValid;
  }

  const SignInModel({
    required this.user,
    required this.password,
  });

  factory SignInModel.empty() {
    return const SignInModel(
      user: '',
      password: Password(''),
    );
  }

  SignInModel copyWith({
    String? user,
    Password? password,
  }) {
    return SignInModel(
      user: user ?? this.user,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': user.toString(),
      'password': password.toString(),
    };
  }
}
