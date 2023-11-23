import 'dart:async';

import '/data/data.dart';
import '/utils/utils.dart';

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();

  AuthenticationAPI? _authenticationAPI;
  AuthenticationRepository() {
    _authenticationAPI = AuthenticationAPI();
  }

  UserModel? appUser;
  AuthenticationStatus appStatus = AuthenticationStatus.unauthenticated;

  UserModel? get user {
    return appUser;
  }

  Stream<AuthenticationStatus> get status async* {
    // await Future<void>.delayed(const Duration(seconds: 1));
    yield appStatus;
    yield* _controller.stream;
  }

  Future<UserModel> logInOrRegister({
    required dynamic body,
  }) async {
    try {
      var data = await _authenticationAPI?.loginWithEmailPassowrd(body: body);
      appUser = UserModel.fromMap(data);

      return appUser!;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> RegisterPassenger({
    required dynamic body,
  }) async {
    try {
      var data = await _authenticationAPI?.registerPassenger(body: body);
      appUser = UserModel.fromMap(data);

      return appUser!;
    } catch (e) {
      rethrow;
    }
  }

  // Future<ChangePasswordModel> changePassword({
  //   required dynamic body,
  // }) async {
  //   try {
  //     final data = await _authenticationAPI?.changePassword(body: body);
  //     return ChangePasswordModel.fromMap(data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<ForgotPasswordModel> forgotPassword({
  //   required dynamic body,
  // }) async {
  //   try {
  //     final data = await _authenticationAPI?.forgotPassword(body: body);
  //     return ForgotPasswordModel.fromMap(data);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  void dispose() => _controller.close();
}
