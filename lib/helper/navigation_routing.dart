import 'package:flutter/material.dart';
import 'package:speedylimo/presentation/app/pages/signup/views/signupmainScreen.dart';

import '/utils/utils.dart';
import '/presentation/presentation.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(builder: (context) => PassengerHomeScreen());
    case splashRoute:
      return MaterialPageRoute(builder: (context) => SplashScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case bottomBarRoute:
      return MaterialPageRoute(builder: (context) => BttomNavigationScreen());
    case forgotPasswordRoute:
      return MaterialPageRoute(builder: (context) => ForgotPasswordScreen());
    case signupRout:
      return MaterialPageRoute(builder: (context) => SignupMainScreen());
    case bookNow:
      return MaterialPageRoute(builder: (context) => BookinNowSceen());
    case profile:
      return MaterialPageRoute(builder: (context) => ProfileScreen());
    case aboutUs:
      return MaterialPageRoute(builder: (context) => AboutUsScreen());
    case policyTerms:
      return MaterialPageRoute(builder: (context) => policyTermsScreen());
    case getSupport:
      return MaterialPageRoute(builder: (context) => GetSupportScreen());
    case careerRoot:
      return MaterialPageRoute(builder: (context) => CareerScreen());
    case changePasswordRoute:
      return MaterialPageRoute(builder: (context) => ChangePasswordScreen());
    case reviewBookingScreen:
      return MaterialPageRoute(builder: (context) => ReviewYourBookingScreen());
    case myride:
      return MaterialPageRoute(builder: (context) => MyRidesScreen());
    case acceptedRides:
      return MaterialPageRoute(builder: (context) => AcceptedRidesScreen());
    case completeRides:
      return MaterialPageRoute(builder: (context) => CompleteRidesScreen());
    case cancellRides:
      return MaterialPageRoute(builder: (context) => CancellRidesScreen());
    case driverMyRide:
      return MaterialPageRoute(builder: (context) => D_MyRidesScreen());
    case driverAcceptedRides:
      return MaterialPageRoute(builder: (context) => D_AcceptedRidesScreen());
    case driverCancelledRides:
      return MaterialPageRoute(builder: (context) => D_CancellRidesScreen());
    case driverCompltetRides:
      return MaterialPageRoute(builder: (context) => D_CompletedRidesScreen());
    case adminHome:
      return MaterialPageRoute(builder: (context) => AdminHomeScreen());
    case driverHome:
      return MaterialPageRoute(builder: (context) => DriverHomeScreen());
    case bookingQueries:
      return MaterialPageRoute(builder: (context) => BookingQueriesScreen());
    case adminpendingrides:
      return MaterialPageRoute(builder: (context) => AdminPendingridesScreen());
    case adminOngoingRide:
      return MaterialPageRoute(builder: (context) => AdminOngoingRidesScreen());
    case adminCanceledRide:
      return MaterialPageRoute(
          builder: (context) => AdminCanceledRidesScreen());
    case adminCompleteRide:
      return MaterialPageRoute(
          builder: (context) => AdminCompleteRidesScreen());
    case userManagement:
      return MaterialPageRoute(builder: (context) => UserManagementScreen());
    case showUserScreen:
      return MaterialPageRoute(builder: (context) => ShowUserScreen());
    case createNewUserScreen:
      return MaterialPageRoute(builder: (context) => CreateNewUserScreen());
    case editNewUserScreen:
      return MaterialPageRoute(builder: (context) => EditNewUserScreen());
    case documentDrtail:
      return MaterialPageRoute(builder: (context) => DocumentDetailScreen());

    default:
      throw ('no route found');
  }
}

class CustomMaterialPageRoute extends MaterialPageRoute {
  @override
  @protected
  bool get hasScopedWillPopCallback {
    return false;
  }

  CustomMaterialPageRoute({
    required WidgetBuilder builder,
    RouteSettings? settings,
    bool maintainState = true,
    bool fullscreenDialog = false,
  }) : super(
          builder: builder,
          settings: settings,
          maintainState: maintainState,
          fullscreenDialog: fullscreenDialog,
        );
}
