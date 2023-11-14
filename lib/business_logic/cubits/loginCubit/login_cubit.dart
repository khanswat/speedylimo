// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../services/services.dart';
// import '/business_logic/cubits/cubits.dart';
// import 'package:formz/formz.dart';
// import '/data/data.dart';

// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit(this._authenticationRepository) : super(const LoginState());

//   final AuthenticationRepository _authenticationRepository;

//   void emailChanged(String value) {
//     final email = Email.dirty(value);
//     emit(state.copyWith(
//       email: email,
//       status: Formz.validate([email]),
//     ));
//   }

//   void passwordChanged(String value) {
//     final password = Password.dirty(value);
//     emit(state.copyWith(
//       password: password,
//       status: Formz.validate([password]),
//     ));
//   }

//   Future<void> logInWithCredentials(String _Email, String _Password) async {
//     if (!state.status.isValidated) return;
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));

//     try {
//       final body = {
//         'user_name': _Email,
//         'user_password': _Password,
//       };
//       var res = await _authenticationRepository.logInOrRegister(body: body);
//       if (res.status == true) {
//         emit(state.copyWith(
//             userModel: res, status: FormzStatus.submissionSuccess));
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
