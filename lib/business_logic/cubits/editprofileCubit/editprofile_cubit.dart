import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import '/services/navigation/navigation_service.dart';

import 'package:formz/formz.dart';
import '/data/data.dart';
import 'edit.profile.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  var context = NavigationService.instance.navigatorKey.currentContext;

  Future updateUserProfileData(
      {required dynamic imageFile, required Map<String, dynamic> data}) async {
    // if (!(state.status.isValidated)) return;
    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    try {
      var formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(imageFile),
        // Add other data fields as needed
        'name': data['name'],
        'email': data['email'],
        'phone_number': data['phone_number'],
        'account_number': data['account_number'],
        'bank_name': data['bank_name'],
        'branch_name': data['branch_name'],
      });

      final resData = await UserRepository.instance.profile(body: formData);
      if (resData == 'success') {
        emit(state.copyWith(
            user: resData,
            status: FormzStatus.submissionSuccess,
            errorMessage: resData));
      } else {
        emit(state.copyWith(
            status: FormzStatus.submissionFailure, errorMessage: resData));
      }
    } on DioError catch (e) {
      emit(state.copyWith(
          errorMessage: e.response?.statusMessage,
          status: FormzStatus.submissionFailure));
    } catch (e) {
      emit(state.copyWith(
          errorMessage: state.errorMessage,
          status: FormzStatus.submissionFailure));
    }
  }

  // Future updateUserProfileImage(base64, String userId) async {
  //   final params = {
  //     'user_id': userId,
  //     'user_image': base64,
  //   };

  //   // emit(EditProfileImageLoading());
  //   emit(state.copyWith(status: FormzStatus.submissionInProgress));
  //   try {
  //     final resData =
  //         await UserRepository.instance.postUserUpdatedProfileImage(params);
  //     if (resData.status == true &&
  //         resData.data != null &&
  //         resData.data != null) {
  //       emit(state.copyWith(user: resData.data));
  //       await Future.delayed(Duration(seconds: 1));
  //       emit(state.copyWith(
  //         user: resData.data,
  //         status: FormzStatus.submissionSuccess,
  //         errorMessage: resData.message,
  //       ));
  //       //emit(EditProfileImageLoaded(user: resData.data, updateSuccessMessage: resData.message));
  //     } else {
  //       //emit(EditProfileImageError(resData.message));
  //       emit(state.copyWith(
  //           status: FormzStatus.submissionFailure,
  //           errorMessage: resData.message));
  //     }
  //   } on DioError catch (e) {
  //     emit(state.copyWith(
  //         errorMessage: e.response?.statusCode == 500
  //             ? e.response?.statusMessage
  //             : e.response?.data['message'].toString(),
  //         status: FormzStatus.submissionFailure));
  //   } catch (e) {
  //     emit(state.copyWith(
  //         errorMessage:
  //             AppLocalizations.of(context!)!.translate('unableupdate'),
  //         status: FormzStatus.submissionFailure));
  //   }

  //   /*on DioError catch (e) {
  //     emit(EditProfileImageError(
  //         AppLocalizations.of(context!)!.translate('unableload')));
  //   } catch (e) {
  //     emit(EditProfileImageError(
  //         AppLocalizations.of(context!)!.translate('unableload')));
  //   }*/
  // }

  // void updateUser(UserData userData) {
  //   emit(state.copyWith(
  //     user: userData,
  //   ));
  // }

  // void nameChanged(String value) {
  //   final name = Name.dirty(value);
  //   emit(state.copyWith(
  //     name: name,
  //     status: Formz.validate([name, state.cnic, state.email]),
  //   ));
  // }

  // void dobChanged(String? value) {
  //   emit(
  //     state.copyWith(dob: value),
  //   );
  // }

  // void genderChanged(String? value) {
  //   emit(state.copyWith(gender: value, status: FormzStatus.valid));
  // }

  // void locChanged(String? value) {
  //   final loc = value;
  //   emit(state.copyWith(location: value));
  // }

  // void emailChanged(String value) {
  //   final email = Email.dirty(value);
  //   emit(state.copyWith(
  //     email: email,
  //     status: Formz.validate([email, state.cnic, state.name]),
  //   ));
  // }

  // void imgFromCamera(String userId) async {
  //   var image =
  //       await _picker.getImage(source: ImageSource.camera, imageQuality: 30);

  //   List<int> imageBytes = await image!.readAsBytes();
  //   var base64Image = base64Encode(imageBytes);
  //   emit(state.copyWith(
  //     imageString: base64Image,
  //   ));
  //   await updateUserProfileImage(base64Image, userId);
  // }

  // Future imgFromGallery(String userId) async {
  //   var image =
  //       await _picker.getImage(source: ImageSource.gallery, imageQuality: 30);

  //   List<int> imageBytes = await image!.readAsBytes();
  //   var base64Image = base64Encode(imageBytes);
  //   emit(state.copyWith(imageString: base64Image));
  //   await updateUserProfileImage(base64Image, userId);
  // }
}
