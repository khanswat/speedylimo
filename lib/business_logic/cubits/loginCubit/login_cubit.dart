import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/services/navigation/navigation_service.dart';
import '/business_logic/cubits/cubits.dart';
import 'package:formz/formz.dart';
import '/data/data.dart';
import 'package:http/http.dart' as http;

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository) : super(const LoginState());
  var context = NavigationService.instance.navigatorKey.currentContext;

  final AuthenticationRepository _authenticationRepository;
  var token;
  final SharedPrefs _sharedPrefs = SharedPrefs();

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

  Future<void> registerDriverWithCredentials(
      {required String email,
      required String password,
      required String password_confirm,
      required String name,
      required File V_insurance,
      required File V_registration,
      required File d_license,
      required File photo,
      required File drugText,
      required String number}) async {
    final url = 'https://myspeedylimo.com/api/user/driver/create';
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    var V_insurance_fileName = V_insurance.path.split('/').last;
    var V_registration_fileName = V_registration.path.split('/').last;
    var d_license_fileName = d_license.path.split('/').last;
    var photo_fileName = photo.path.split('/').last;
    var drugText_fileName = drugText.path.split('/').last;
    await _sharedPrefs.getToken().then((value) {
      token = value;
    });

    try {
      var formData = FormData.fromMap({
        'cnic_front': await MultipartFile.fromFile(
          V_insurance.path,
          filename: V_insurance_fileName,
        ),
        'driving_license': await MultipartFile.fromFile(
          d_license.path,
          filename: d_license_fileName,
        ),
        'partner_photo': await MultipartFile.fromFile(
          photo.path,
          filename: photo_fileName,
        ),
        'vehicle_reg_book': await MultipartFile.fromFile(
          V_registration.path,
          filename: V_registration_fileName,
        ),
        'cnic_back': await MultipartFile.fromFile(
          drugText.path,
          filename: drugText_fileName,
        ),
        'name': name,
        'email': email,
        'phone_number': number,
        'password': password,
        'password_confirmation': password_confirm,
      });
      final response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json'
          }));

      if (response.statusMessage == 'success') {
        emit(state.copyWith(
            userModel: response.data, status: FormzStatus.submissionSuccess));
      } else {
        emit(state.copyWith(
            errorMessage: response.statusMessage,
            status: FormzStatus.submissionFailure));
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

  // Future<void> DriverCreation(
  //     {required String drivingLicense,
  //     required String photo,
  //     required String vehicleReg,
  //     required String vehicleInurance,
  //     required String Drugtest,
  //     required Map<String, String> params}) async {
  //
  //   try {
  //     var request = http.MultipartRequest(
  //         'POST', Uri.parse('https://myspeedylimo.com/api/user/driver/create'));

  //     // Add file to the request
  //     request.files.add(
  //         await http.MultipartFile.fromPath('driving_license', drivingLicense));
  //     request.files
  //         .add(await http.MultipartFile.fromPath('partner_photo', photo));
  //     request.files.add(
  //         await http.MultipartFile.fromPath('vehicle_reg_book', vehicleReg));
  //     request.files.add(
  //         await http.MultipartFile.fromPath('cnic_front', vehicleInurance));
  //     request.files
  //         .add(await http.MultipartFile.fromPath('cnic_back', Drugtest));

  //     params.forEach((key, value) {
  //       request.fields[key] = value;
  //     });

  //     // Set Bearer token in the header
  //

  //     // Send the request
  //     var response = await request.send();

  //     //for getting and decoding the response into json format
  //     var responsed = await http.Response.fromStream(response);
  //     final responseData = json.decode(responsed.body);

  //     if (response.statusCode == 200) {
  //       print("SUCCESS");
  //       print(responseData);
  //     } else {
  //       print("ERROR");
  //     }
  //   } catch (e) {
  //     // Handle exceptions
  //     print('Error uploading file: $e');
  //   }
  // }

}
