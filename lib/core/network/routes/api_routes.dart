class ApiRoutes {
  static const String baseUrl = 'https://myspeedylimo.com/';

  static const String loginUrl = '${baseUrl}api/user/login';
  static const String registerPassengerUrl = '${baseUrl}api/user/registration';
  static const String MyRidesUrl = '${baseUrl}api/get-rides/pending';
  static const String AcceptedRidesUrl = '${baseUrl}api/get-rides/ongoing';
  static const String CancelRidesUrl = '${baseUrl}api/get-rides/cancelled';
  static const String CompletedRidesUrl = '${baseUrl}api/get-rides/completed';
}
