import '../../core/core.dart';

class UserAPI {
  UserAPI();

  // Future<dynamic> getRevenue() async {
  //   try {
  //     return await HTTP.instance.iGet(ApiRoutes.RevenueUrl);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  Future<dynamic> getMyRides() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.MyRidesUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getAcceptedRides() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.AcceptedRidesUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCancelRides() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.CancelRidesUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCompletedRides() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.CompletedRidesUrl);
    } catch (e) {
      rethrow;
    }
  }
}
