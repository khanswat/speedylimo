import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '../../../core/core.dart';

import 'package:formz/formz.dart';
import '/data/data.dart';
import 'edit.profile.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());

  var token;
  final SharedPrefs _sharedPrefs = SharedPrefs();

  Future<void> updateProfile({
    required String email,
    required String name,
    required String phone,
    required String accountnumber,
    required String bankname,
    required String branchname,
    required File image,
  }) async {
    final url = ApiRoutes.updateProfile_Url;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    var image_fileName = image.path.split('/').last;

    await _sharedPrefs.getToken().then((value) {
      token = value;
    });

    try {
      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image.path,
          filename: image_fileName,
        ),
        'name': name,
        'email': email,
        'phone_number': phone,
        'account_number': accountnumber,
        'bank_name': bankname,
        'branch_name': branchname,
      });
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
            'Content-Type': 'multipart/form-data',
          }));

      if (response.data == 'success') {
        emit(state.copyWith(
            user: response.data, status: FormzStatus.submissionSuccess));
        print(response.data);
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
