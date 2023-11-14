// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';
// import '/data/data.dart';

// class ForgotPasswordstate extends Equatable {
//   const ForgotPasswordstate({
//     this.status = FormzStatus.pure,
//     this.errorMessage,
//     this.forgotPasswordModel,
//     this.email = const Email.pure(),
//   });

//   final FormzStatus status;

//   final Email email;

//   final String? errorMessage;
//   final ForgotPasswordModel? forgotPasswordModel;

//   @override
//   List<Object> get props => [status, email];

//   ForgotPasswordstate copyWith({
//     FormzStatus? status,
//     String? errorMessage,
//     ForgotPasswordModel? forgotPasswordModel,
//     Email? email,
//   }) {
//     return ForgotPasswordstate(
//         status: status ?? this.status,
//         errorMessage: errorMessage ?? this.errorMessage,
//         forgotPasswordModel: forgotPasswordModel ?? this.forgotPasswordModel,
//         email: email ?? this.email);
//   }
// }
