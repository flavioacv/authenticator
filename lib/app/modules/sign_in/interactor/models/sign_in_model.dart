import 'package:authenticator/app/core/value_objects/password.dart';
import 'package:authenticator/app/core/value_objects/user.dart';

class SignInModel {
  final User user;
  final Password password;

  bool get isValid {
    return user.isValid && password.isValid;
  }

  const SignInModel({
    required this.user,
    required this.password,
  });

  factory SignInModel.empty() {
    return const SignInModel(
      user: User(''),
      password: Password(''),
    );
  }

  SignInModel copyWith({
    User? user,
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
