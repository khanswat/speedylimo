import 'package:flutter/material.dart';

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
      return MaterialPageRoute(builder: (context) => SignupScreen());
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
    case bookingDetail:
      return MaterialPageRoute(builder: (context) => BookingDetailScreen());
    case acceptedRides:
      return MaterialPageRoute(builder: (context) => AcceptedRidesScreen());
    case acceptedRidesDetail:
      return MaterialPageRoute(
          builder: (context) => AcceptedRideDetailScreen());
    case completeRides:
      return MaterialPageRoute(builder: (context) => CompleteRidesScreen());

    case completeRidesDetails:
      return MaterialPageRoute(
          builder: (context) => CompleteRideDetailScreen());
    case cancellRides:
      return MaterialPageRoute(builder: (context) => CancellRidesScreen());
    case cancellRidesDetails:
      return MaterialPageRoute(builder: (context) => CancellRideDetailScreen());
    case driverMyRide:
      return MaterialPageRoute(builder: (context) => D_MyRidesScreen());
    case driverMyRidesDetails:
      return MaterialPageRoute(builder: (context) => D_BookingDetailScreen());
    case driverAcceptedRides:
      return MaterialPageRoute(builder: (context) => D_AcceptedRidesScreen());
    case driverCancelledRides:
      return MaterialPageRoute(builder: (context) => D_CancellRidesScreen());
    case driverCancelledRidesDetail:
      return MaterialPageRoute(
          builder: (context) => D_CancellRideDetailScreen());
    case driverCompltetRides:
      return MaterialPageRoute(builder: (context) => D_CompletedRidesScreen());
    case driverCompleteRidesDetail:
      return MaterialPageRoute(
          builder: (context) => D_CompleteRideDetailScreen());
    case adminHome:
      return MaterialPageRoute(builder: (context) => AdminHomeScreen());
    case driverHome:
      return MaterialPageRoute(builder: (context) => DriverHomeScreen());
    case bookingQueries:
      return MaterialPageRoute(builder: (context) => BookingQueriesScreen());
    case bookingQueriesDetail:
      return MaterialPageRoute(
          builder: (context) => BookingQueriesDetailScreen());
    case adminpendingrides:
      return MaterialPageRoute(builder: (context) => AdminPendingridesScreen());
    case adminPendingRideDetail:
      return MaterialPageRoute(
          builder: (context) => AdminPendingRideDetailScreen());
    case adminOngoingRide:
      return MaterialPageRoute(builder: (context) => AdminOngoingRidesScreen());
    case adminOngoingRideDetail:
      return MaterialPageRoute(
          builder: (context) => AdminOngoingRideDetailScreen());
    case adminCanceledRide:
      return MaterialPageRoute(
          builder: (context) => AdminCanceledRidesScreen());
    case adminCanceledRideDetail:
      return MaterialPageRoute(
          builder: (context) => AdminCanceledRideDetailScreen());
    case adminCompleteRide:
      return MaterialPageRoute(
          builder: (context) => AdminCompleteRidesScreen());
    case adminCompleteRideDetail:
      return MaterialPageRoute(
          builder: (context) => AdminCompletedRideDetailScreen());
    case userManagement:
      return MaterialPageRoute(builder: (context) => UserManagementScreen());
    case showUserScreen:
      return MaterialPageRoute(builder: (context) => ShowUserScreen());
    case createNewUserScreen:
      return MaterialPageRoute(builder: (context) => CreateNewUserScreen());
    case editNewUserScreen:
      return MaterialPageRoute(builder: (context) => EditNewUserScreen());
    case documentScreen:
      return MaterialPageRoute(builder: (context) => DocumentScreen());
    case documentDrtail:
      return MaterialPageRoute(builder: (context) => DocumentDetailScreen());
    // case RevenueRoute:
    //   return MaterialPageRoute(builder: (context) => RevenueScreen());
    // case InPatientDesRoute:
    //   final argu
    // = settings.arguments as dynamic;
    //   return MaterialPageRoute(
    //       builder: (context) => InPatientDes_Screen(
    //           argu['day'] as dynamic, argu['month'] as String));
    // case OutPatientDesRoute:
    //   final argu = settings.arguments as dynamic;
    //   return MaterialPageRoute(
    //       builder: (context) => OutPatientDes_Screen(
    //           argu['day'] as dynamic, argu['month'] as String));
    // case SummaryRoute:
    //   final argu = settings.arguments as dynamic;
    //   return MaterialPageRoute(
    //       builder: (context) => RevenueSummaryScreen(argu['month'] as String));
    // case BugetRoute:
    //   return MaterialPageRoute(builder: (context) => BudgetScreen());
    // case BugetSummaryRoute:
    //   final argu = settings.arguments as dynamic;
    //   return MaterialPageRoute(
    //       builder: (context) => BudgetSummaryScreen(argu['month'] as String));
    // case RevnueComparisonRoute:
    //   return MaterialPageRoute(builder: (context) => RevenueComparisonScren());

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
