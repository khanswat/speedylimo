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

  Future<dynamic> profile({required body}) async {
    try {
      return await HTTP.instance.iPost(ApiRoutes.updateProfile_Url, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getMyRides() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.MyRidesUrl);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getPrice({required body}) async {
    try {
      return await HTTP.instance.iPost(ApiRoutes.priceUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getCompleteRide({required body}) async {
    try {
      return await HTTP.instance.iPost(ApiRoutes.completeRideUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getcancelRide({required body}) async {
    try {
      return await HTTP.instance.iPost(ApiRoutes.cancelUrl, data: body);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getcompleteRide({required body}) async {
    try {
      return await HTTP.instance.iPost(ApiRoutes.cancelUrl, data: body);
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

  Future<dynamic> getStatus() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.status_Url);
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getBookingQueries() async {
    try {
      return await HTTP.instance.iGet(ApiRoutes.bookingQueries_Url);
    } catch (e) {
      rethrow;
    }
  }
}
