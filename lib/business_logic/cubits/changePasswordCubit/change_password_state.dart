// import 'package:equatable/equatable.dart';
// import 'package:formz/formz.dart';

// import '../../../data/data.dart';

// class ChangePasswordstate extends Equatable {
//   const ChangePasswordstate({
//     this.status = FormzStatus.pure,
//     this.errorMessage,
//     this.changePasswordModel,
//     this.oldpassword = const Password.pure(),
//     this.newpassword = const Password.pure(),
//     this.confirmpassword = const Password.pure(),
//   });

//   final FormzStatus status;

//   final Password oldpassword;
//   final Password newpassword;
//   final Password confirmpassword;
//   final String? errorMessage;
//   final ChangePasswordModel? changePasswordModel;

//   @override
//   List<Object> get props => [status, oldpassword, newpassword, confirmpassword];

//   ChangePasswordstate copyWith(
//       {FormzStatus? status,
//       String? errorMessage,
//       ChangePasswordModel? changePasswordModel,
//       Password? oldpassword,
//       Password? newpassword,
//       Password? confirmpassword}) {
//     return ChangePasswordstate(
//         status: status ?? this.status,
//         errorMessage: errorMessage ?? this.errorMessage,
//         changePasswordModel: changePasswordModel ?? this.changePasswordModel,
//         newpassword: newpassword ?? this.newpassword,
//         confirmpassword: confirmpassword ?? this.confirmpassword,
//         oldpassword: oldpassword ?? this.oldpassword);
//   }
// }
