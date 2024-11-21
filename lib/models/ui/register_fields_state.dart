import 'package:contty_app/models/service/user.dart';

class RegisterState {
  final String email;
  final String password;
  final String? emailError;

  final String? passwordError;
  final String? repeatPassword;
  final String? repeatPasswordError;
  final String? strenghPaswword;
  final bool isLoading;

  const RegisterState({
    this.email = '',
    this.password = '',
    this.emailError,
    this.passwordError,
    this.repeatPassword,
    this.repeatPasswordError,
    this.strenghPaswword,
    this.isLoading = false,
  });

  RegisterState copyWith({
    String? email,
    String? password,
    String? emailError,
    String? passwordError,
    String? repeatPassword,
    String? repeatPasswordError,
    String? strenghPaswword,
    bool? isLoading,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      emailError: emailError,
      passwordError: passwordError,
      repeatPassword: repeatPassword ?? this.repeatPassword,
      repeatPasswordError: repeatPasswordError ?? this.repeatPasswordError,
      strenghPaswword: strenghPaswword ?? this.strenghPaswword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
