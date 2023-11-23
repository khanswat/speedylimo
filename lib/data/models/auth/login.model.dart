import 'package:formz/formz.dart';
import '/utils/utils.dart';

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([String value = '']) : super.dirty(value);

  @override
  EmailValidationError? validator(String? value) {
    return ((value != null && value.isEmpty) ||
            emailRegExp.hasMatch(value ?? ''))
        ? null
        : EmailValidationError.invalid;
  }
}

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String? value) {
    return ((value != null && value.isEmpty) ||
            passwordRegExp.hasMatch(value ?? ''))
        ? null
        : PasswordValidationError.invalid;
  }
}

class Name extends FormzInput<String, NameValidationError> {
  const Name.pure() : super.pure('');

  const Name.dirty([String value = '']) : super.dirty(value);

  @override
  NameValidationError? validator(String? value) {
    return ((value != null && value.isEmpty) ||
            nameRegExp.hasMatch(value ?? ''))
        ? null
        : NameValidationError.invalid;
  }
}

class Number extends FormzInput<String, NumberValidationError> {
  const Number.pure() : super.pure('');

  const Number.dirty([String value = '']) : super.dirty(value);

  @override
  NumberValidationError? validator(String? value) {
    return ((value != null && value.isEmpty) ||
            numberRegExp.hasMatch(value ?? ''))
        ? null
        : NumberValidationError.invalid;
  }
}

class logInOrRegisterFailure implements Exception {
  const logInOrRegisterFailure([
    this.message = 'An unknown exception occurred.',
  ]);

  factory logInOrRegisterFailure.fromCode(String code) {
    switch (code) {
      case 'wrong-credential':
        return const logInOrRegisterFailure(
          'Incorrect password/email, please try again.',
        );
      default:
        return logInOrRegisterFailure(code);
    }
  }

  final String message;
}
