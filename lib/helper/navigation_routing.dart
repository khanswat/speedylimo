import 'package:flutter/material.dart';

import '/utils/utils.dart';
import '/presentation/presentation.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case homeRoute:
      return MaterialPageRoute(
          builder: (context) => const PassengerHomeScreen());
    case splashRoute:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case loginRoute:
      return MaterialPageRoute(builder: (context) => LoginScreen());
    case homeRoute1:
      return MaterialPageRoute(
          builder: (context) => const BttomNavigationScreen());
    case forgotPasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ForgotPasswordScreen());
    case signupRout:
      return MaterialPageRoute(builder: (context) => const SignupScreen());
    case bookNow:
      return MaterialPageRoute(builder: (context) => const BookinNowSceen());
    case profile:
      return MaterialPageRoute(builder: (context) => const ProfileScreen());
    case aboutUs:
      return MaterialPageRoute(builder: (context) => const AboutUsScreen());
    case policyTerms:
      return MaterialPageRoute(builder: (context) => const policyTermsScreen());
    case getSupport:
      return MaterialPageRoute(builder: (context) => const GetSupportScreen());
    case careerRoot:
      return MaterialPageRoute(builder: (context) => const CareerScreen());
    case changePasswordRoute:
      return MaterialPageRoute(
          builder: (context) => const ChangePasswordScreen());
    case reviewBookingScreen:
      return MaterialPageRoute(
          builder: (context) => const ReviewYourBookingScreen());
    case myride:
      return MaterialPageRoute(builder: (context) => const MyRidesScreen());
    case bookingDetail:
      return MaterialPageRoute(
          builder: (context) => const BookingDetailScreen());
    case acceptedRides:
      return MaterialPageRoute(
          builder: (context) => const AcceptedRidesScreen());
    case acceptedRidesDetail:
      return MaterialPageRoute(
          builder: (context) => const AcceptedRideDetailScreen());
    case completeRides:
      return MaterialPageRoute(
          builder: (context) => const CompleteRidesScreen());

    case completeRidesDetails:
      return MaterialPageRoute(
          builder: (context) => const CompleteRideDetailScreen());
    case cancellRides:
      return MaterialPageRoute(
          builder: (context) => const CancellRidesScreen());
    case cancellRidesDetails:
      return MaterialPageRoute(
          builder: (context) => const CancellRideDetailScreen());
    case driverMyRide:
      return MaterialPageRoute(builder: (context) => const D_MyRidesScreen());
    case driverMyRidesDetails:
      return MaterialPageRoute(
          builder: (context) => const D_BookingDetailScreen());
    case driverAcceptedRides:
      return MaterialPageRoute(
          builder: (context) => const D_AcceptedRidesScreen());
    case driverCancelledRides:
      return MaterialPageRoute(
          builder: (context) => const D_CancellRidesScreen());
    case driverCancelledRidesDetail:
      return MaterialPageRoute(
          builder: (context) => const D_CancellRideDetailScreen());
    case driverCompltetRides:
      return MaterialPageRoute(
          builder: (context) => const D_CompletedRidesScreen());
    case driverCompleteRidesDetail:
      return MaterialPageRoute(
          builder: (context) => const D_CompleteRideDetailScreen());
    case adminHome:
      return MaterialPageRoute(builder: (context) => const AdminHomeScreen());
    case driverHome:
      return MaterialPageRoute(builder: (context) => const DriverHomeScreen());
    case adminPost:
      return MaterialPageRoute(builder: (context) => const AdminPostScreen());
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
