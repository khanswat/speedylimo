import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '/data/data.dart';

class LoginState extends Equatable {
  const LoginState({
    this.email = const Email.pure(),
    this.name = const Name.pure(),
    this.number = const Number.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.userModel,
    this.password = const Password.pure(),
  });

  final FormzStatus status;
  final Email email;
  final Name name;
  final Number number;
  final Password password;
  final String? errorMessage;
  final UserModel? userModel;

  @override
  List<Object> get props => [status, email, password, name, number];

  LoginState copyWith(
      {Email? email,
      FormzStatus? status,
      String? errorMessage,
      Name? name,
      Number? number,
      UserModel? userModel,
      Password? password}) {
    return LoginState(
        email: email ?? this.email,
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        userModel: userModel ?? this.userModel,
        name: name ?? this.name,
        number: number ?? this.number,
        password: password ?? this.password);
  }
}
