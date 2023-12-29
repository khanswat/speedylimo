import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:formz/formz.dart';
import 'package:speedylimo/services/navigation/navigation_service.dart';

import '../../../data/data.dart';
import '../cubits.dart';

class SupportCubit extends Cubit<SupportState> {
  SupportCubit() : super(const SupportState());
  var context = NavigationService.instance.navigatorKey.currentContext;

  var token;
  final SharedPrefs _sharedPrefs = SharedPrefs();

  Future<void> PostSupport(
      {required String email,
      required String contact_method,
      required String first_name,
      required String last_name,
      required String company_name,
      required String technology,
      required String summary,
      required String request_detail,
      required File file,
      required String number}) async {
    final url = 'https://myspeedylimo.com/api/support';
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    var file_fileName = file.path.split('/').last;

    await _sharedPrefs.getToken().then((value) {
      token = value;
    });

    try {
      var formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          file.path,
          filename: file_fileName,
        ),
        'technology': technology,
        'email': email,
        'first_name': first_name,
        'last_name': last_name,
        'phone_no': number,
        'contact_method': contact_method,
        'company_name': company_name,
        'summary': summary,
        'request_detail': request_detail
      });
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {'Accept': 'application/json'}));

      if (response.statusMessage == 'success') {
        emit(state.copyWith(
            supportModel: response.data,
            status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            errorMessage: response.statusMessage,
            status: FormzStatus.submissionFailure));
      }
    } on DioError catch (e) {
      emit(state.copyWith(
          errorMessage: e.response?.statusMessage,
          status: FormzStatus.submissionFailure));
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
