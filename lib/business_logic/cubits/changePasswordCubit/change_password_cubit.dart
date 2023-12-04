import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:formz/formz.dart';

import '../../../data/data.dart';
import '../../../services/services.dart';
import 'changePassword.cubit.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordstate> {
  ChangePasswordCubit(this.authenticationRepository)
      : super(const ChangePasswordstate());

  final AuthenticationRepository authenticationRepository;
  var context = NavigationService.instance.navigatorKey.currentContext;

  void oldpasswordChanged(String value) {
    final oldpassword = Password.dirty(value);
    emit(state.copyWith(
      oldpassword: oldpassword,
      status: Formz.validate([oldpassword]),
    ));
  }

  void newpasswordChanged(String value) {
    final newpassword = Password.dirty(value);
    emit(state.copyWith(
      newpassword: newpassword,
      status: Formz.validate([newpassword]),
    ));
  }

  void confirmpasswordChanged(String value) {
    final confirmpassword = Password.dirty(value);
    emit(state.copyWith(
      confirmpassword: confirmpassword,
      status: Formz.validate([confirmpassword]),
    ));
  }

  Future<void> ChangePassword(
      {required oldpass, required newpass, required confirmpass}) async {
    // if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final body = {
        'old_password': oldpass,
        'password': newpass,
        'password_confirmation': confirmpass
      };
      var res = await authenticationRepository.changePassword(body: body);
      if (res.status == 'success') {
        emit(state.copyWith(
            changePasswordModel: res, status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            errorMessage: res.message, status: FormzStatus.submissionFailure));
      }
    } on logInOrRegisterFailure catch (e) {
      emit(state.copyWith(
        errorMessage: e.message,
        status: FormzStatus.submissionFailure,
      ));
    } on DioError catch (e) {
      emit(state.copyWith(
          errorMessage: e.response?.data == null
              ? e.response?.statusMessage
              : e.response?.data['message'].toString(),
          status: FormzStatus.submissionFailure));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
