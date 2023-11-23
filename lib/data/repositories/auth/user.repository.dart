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
}
