// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import '/data/data.dart';

// class LoginState extends Equatable {
//   const LoginState({
//     this.email = const Email.pure(),
//     this.status = FormzStatus.pure,
//     this.errorMessage,
//     this.userModel,
//     this.password = const Password.pure(),
//   });

//   final FormzStatus status;
//   final Email email;
//   final Password password;
//   final String? errorMessage;
//   final UserModel? userModel;

//   @override
//   List<Object> get props => [status, email, password];

//   LoginState copyWith(
//       {Email? email,
//       FormzStatus? status,
//       String? errorMessage,
//       UserModel? userModel,
//       Password? password}) {
//     return LoginState(
//         email: email ?? this.email,
//         status: status ?? this.status,
//         errorMessage: errorMessage ?? this.errorMessage,
//         userModel: userModel ?? this.userModel,
//         password: password ?? this.password);
//   }
// }
