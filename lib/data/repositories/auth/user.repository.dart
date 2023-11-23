import 'package:speedylimo/data/data.dart';

import '../../providers/user.api.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository _instance = UserRepository._privateConstructor();

  static UserRepository get instance => _instance;

  final UserAPI _userAPI = UserAPI();

  // Future<LogoutModel> getlogout() async {
  //   try {
  //     final res = await _userAPI.getlogout();
  //     return LogoutModel.fromMap(res);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

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
}
