class ApiRoutes {
  static const String baseUrl = 'https://myspeedylimo.com/';

  static const String loginUrl = '${baseUrl}api/user/login';
  static const String registerPassengerUrl = '${baseUrl}api/user/registration';
  static const String MyRidesUrl = '${baseUrl}api/get-rides/pending';
  static const String AcceptedRidesUrl = '${baseUrl}api/get-rides/ongoing';
  static const String CancelRidesUrl = '${baseUrl}api/get-rides/cancelled';
  static const String CompletedRidesUrl = '${baseUrl}api/get-rides/completed';
  static const String priceUrl = '${baseUrl}api/get-ride-price';
  static const String completeRideUrl = '${baseUrl}api/accept-ride';
  static const String cancelUrl = '${baseUrl}api/cancel-ride';
  static const String completeUrl = '${baseUrl}api/complete-ride';
  static const String forgotPassword_Url = '${baseUrl}api/password/forgot';
  static const String changePassword_Url = '${baseUrl}api/password/change';
  static const String updateProfile_Url = '${baseUrl}api/update-profile';
  static const String status_Url = '${baseUrl}api/update-user-status';
  static const String bookingQueries_Url = '${baseUrl}api/support';
}
