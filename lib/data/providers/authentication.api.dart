import '/core/network/network.dart';
import '/core/core.dart';

class AuthenticationAPI {
  AuthenticationAPI();
  final http = HTTP.instance;

  Future<dynamic> loginWithEmailPassowrd({required body}) async {
    try {
      return await http.iPost(ApiRoutes.loginUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registerPassenger({required body}) async {
    try {
      return await http.iPost(ApiRoutes.registerPassengerUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  // Future<dynamic> changePassword({required body}) async {
  //   try {
  //     return await HTTP.instance
  //         .iPost(ApiRoutes.changePassword_Url, data: body);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<dynamic> forgotPassword({required body}) async {
  //   try {
  //     return await HTTP.instance
  //         .iPost(ApiRoutes.forgotPassword_Url, data: body);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
