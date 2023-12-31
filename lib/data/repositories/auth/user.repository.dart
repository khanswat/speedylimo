import 'dart:io';

import 'package:dio/dio.dart';
import 'package:speedylimo/core/core.dart';
import 'package:speedylimo/data/data.dart';

import '../../providers/user.api.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final UserAPI _userAPI = UserAPI();
  final Dio _dio = Dio();
  var token;

  final SharedPrefs _sharedPrefs = SharedPrefs();

  // Future<LogoutModel> getlogout() async {
  //   try {
  //     final res = await _userAPI.getlogout();
  //     return LogoutModel.fromMap(res);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<String> uploadImage(File imageFile, Map<String, dynamic> data) async {
    try {
      FormData formData = FormData.fromMap({
        //'image': await MultipartFile(mageFile.path),
        // Add other data fields as needed
        'field1': data['field1'],
        'field2': data['field2'],
      });

      Response response =
          await _dio.post('YOUR_UPLOAD_API_ENDPOINT', data: formData);

      return response.data['imageUrl'];
    } catch (error) {
      throw Exception('Image upload failed: $error');
    }
  }

  Future<MyRidesModel> getMyRides() async {
    try {
      final res = await _userAPI.getMyRides();
      return MyRidesModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<AcceptedRidesModel> getAcceptedRides() async {
    try {
      final res = await _userAPI.getAcceptedRides();
      return AcceptedRidesModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<CancelRidesModel> getCancelRides() async {
    try {
      final res = await _userAPI.getCancelRides();
      return CancelRidesModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<CompletedRidesModel> getCompletedRides() async {
    try {
      final res = await _userAPI.getCompletedRides();
      return CompletedRidesModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<PriceModel> getPrice({required body}) async {
    try {
      final res = await _userAPI.getPrice(body: body);
      return PriceModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<BookNowModel> PostBookNow({required body}) async {
    try {
      final res = await _userAPI.PostBooknow(body: body);
      return BookNowModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<CompletedModel> postAccept({required body}) async {
    try {
      final res = await _userAPI.getCompleteRide(body: body);
      return CompletedModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<CancelModel> postcancel({required body}) async {
    try {
      final res = await _userAPI.getcancelRide(body: body);
      return CancelModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<CompleteModel> postComplete({required body}) async {
    try {
      final res = await _userAPI.getcompleteRide(body: body);
      return CompleteModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> profile({
    required dynamic body,
  }) async {
    await _sharedPrefs.getToken().then(
      (value) {
        token = value;
      },
    );
    try {
      var response = await _dio.post(ApiRoutes.updateProfile_Url,
          data: body,
          options: Options(headers: {
            'Content-Type': 'multipart/form-data',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json'
          }));

      return response.data['message'];
    } catch (e) {
      rethrow;
    }
  }

  Future<StatusModel> getStatus() async {
    try {
      final res = await _userAPI.getStatus();
      return StatusModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<BokingQueriesModel> getBookingQueries() async {
    try {
      final res = await _userAPI.getBookingQueries();
      return BokingQueriesModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<AdminDriverModel> getUserManagement() async {
    try {
      final res = await _userAPI.getUserManagement();
      return AdminDriverModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<AdminPassengerModel> getUserManagementPassenger() async {
    try {
      final res = await _userAPI.getUserManagementPassenger();
      return AdminPassengerModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }

  Future<DeleteModel> getUserDelete(dynamic id) async {
    try {
      final res = await _userAPI.getUserDelete(id: id);
      return DeleteModel.fromMap(res);
    } catch (e) {
      rethrow;
    }
  }
}
