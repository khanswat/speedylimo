// import 'package:bloc/bloc.dart';
// import 'package:dio/dio.dart';
// import 'package:formz/formz.dart';
// import 'package:shifa_financial_app/data/data.dart';

// import '../../../services/services.dart';
// import '../cubits.dart';

// class ForgotPasswordCubit extends Cubit<ForgotPasswordstate> {
//   ForgotPasswordCubit(this.authenticationRepository)
//       : super(const ForgotPasswordstate());

//   final AuthenticationRepository authenticationRepository;
//   var context = NavigationService.instance.navigatorKey.currentContext;

//   void emailChanged(String value) {
//     final email = Email.dirty(value);
//     emit(state.copyWith(
//       email: email,
//       status: Formz.validate([email]),
//     ));
//   }

//   Future<void> ForgotEmail(
//     String _email,
//   ) async {
//     if (!state.status.isValidated) return;
//     emit(state.copyWith(status: FormzStatus.submissionInProgress));

//     try {
//       final body = {
//         'user_email': _email,
//       };
//       var res = await authenticationRepository.forgotPassword(body: body);
//       if (res.status == true) {
//         emit(state.copyWith(
//             forgotPasswordModel: res, status: FormzStatus.submissionSuccess));
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
