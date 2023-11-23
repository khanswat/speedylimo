import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/business_logic/cubits/cubits.dart';
import 'package:formz/formz.dart';
import '/data/data.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());

  final AuthenticationRepository _authenticationRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate([email]),
    ));
  }

  void nameChanged(String value) {
    final name = Name.dirty(value);
    emit(state.copyWith(
      name: name,
      status: Formz.validate([name]),
    ));
  }

  void numberChanged(String value) {
    final number = Number.dirty(value);
    emit(state.copyWith(
      number: number,
      status: Formz.validate([number]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate([password]),
    ));
  }

  Future<void> logInWithCredentials(String _Email, String _Password) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final body = {
        'email': _Email,
        'password': _Password,
      };
      var res = await _authenticationRepository.logInOrRegister(body: body);

      if (res.status == 200) {
        emit(state.copyWith(
            userModel: res, status: FormzStatus.submissionSuccess));
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

  Future<void> registerPassengerWithCredentials(
      {required email,
      required password,
      required name,
      required number}) async {
    if (!state.status.isValidated) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      final body = {
        'name': name,
        'email': email,
        'phone_number': number,
        'password': password
      };
      var res = await _authenticationRepository.RegisterPassenger(body: body);

      if (res.status == 200) {
        emit(state.copyWith(
            userModel: res, status: FormzStatus.submissionSuccess));
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
          errorMessage: e.response?.statusMessage,
          status: FormzStatus.submissionFailure));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
