// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:formz/formz.dart';
// import 'package:shifa_financial_app/data/data.dart';

// import '../../../services/services.dart';
// import '../cubits.dart';

// class ChangePasswordCubit extends Cubit<ChangePasswordstate> {
//   ChangePasswordCubit(this.authenticationRepository)
//       : super(const ChangePasswordstate());

//   final AuthenticationRepository authenticationRepository;
//   var context = NavigationService.instance.navigatorKey.currentContext;

//   void oldpasswordChanged(String value) {
//     final oldpassword = Password.dirty(value);
//     emit(state.copyWith(
//       oldpassword: oldpassword,
//       status: Formz.validate([oldpassword]),
//     ));
//   }

//   void newpasswordChanged(String value) {
//     final newpassword = Password.dirty(value);
//     emit(state.copyWith(
//       newpassword: newpassword,
//       status: Formz.validate([newpassword]),
//     ));
//   }

//   void confirmpasswordChanged(String value) {
//     final confirmpassword = Password.dirty(value);
//     emit(state.copyWith(
//       confirmpassword: confirmpassword,
//       status: Formz.validate([confirmpassword]),
//     ));
//   }

//   Future<void> ChangePassword(
//       String _oldpass, String _newpass, String _confirmpass) async {
//     // if (!state.status.isValidated) return;
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));

//     try {
//       final body = {
//         'current_password': _oldpass,
//         'new_password': _newpass,
//         'confirm_password': _confirmpass
//       };
//       var res = await authenticationRepository.changePassword(body: body);
//       if (res.status == true) {
//         emit(state.copyWith(
//             changePasswordModel: res, status: FormzStatus.submissionSuccess));
//       } else {
//         emit(state.copyWith(
//             errorMessage: res.message, status: FormzStatus.submissionFailure));
//       }
//     } on logInOrRegisterFailure catch (e) {
//       emit(state.copyWith(
//         errorMessage: e.message,
//         status: FormzStatus.submissionFailure,
//       ));
//     } on DioError catch (e) {
//       emit(state.copyWith(
//           errorMessage: e.response?.data == null
//               ? e.response?.statusMessage
//               : e.response?.data['message'].toString(),
//           status: FormzStatus.submissionFailure));
//     } catch (_) {
//       emit(state.copyWith(status: FormzStatus.submissionFailure));
//     }
//   }
// }
