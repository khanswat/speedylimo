import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'business_logic/cubits/cubits.dart';
import 'data/data.dart';
import 'helper/helper.dart';
import 'services/services.dart';
import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(MyApp(authenticationRepository: AuthenticationRepository())),
    storage: storage,
  );
}

class MyApp extends StatefulWidget {
  final AuthenticationRepository authenticationRepository;

  const MyApp({Key? key, required this.authenticationRepository})
      : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: widget.authenticationRepository,
      child: MultiBlocProvider(
        providers: [
          // BlocProvider(
          //     create: (context) => LoginCubit(widget.authenticationRepository)),
          BlocProvider(create: (context) => ThemeCubit()),
          // BlocProvider(create: (context) => RevenueCubit()),
          // BlocProvider(create: (context) => OpDetailCubit()),
          BlocProvider(create: (context) => IpDetailCubit()),
          BlocProvider(create: (context) => UserCubit()),
          // BlocProvider(create: (context) => MonthlyCubit()),
          // BlocProvider(create: (context) => YearlyCubit()),
          BlocProvider(create: (context) => LogoutCubit()),
          // BlocProvider(create: (context) => BudgetCubit()),
          // BlocProvider(create: (context) => CurrentCubit()),
          // BlocProvider(create: (context) => FinanciaCubit()),
          // BlocProvider(create: (context) => QuaterlyComparisonCubit()),
          // BlocProvider(create: (context) => MonthlyComparisonCubit()),
          // BlocProvider(create: (context) => YearlyComparisonCubit()),
          // BlocProvider(
          //     create: (context) => ChangePasswordCubit(
          //           widget.authenticationRepository,
          //         )),
          // BlocProvider(
          //     create: (context) => ForgotPasswordCubit(
          //           widget.authenticationRepository,
          //         )),
          BlocProvider(
              create: (context) => InternetCubit(connectivity: Connectivity())),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                onGenerateRoute: generateRoute,
                navigatorKey: NavigationService.instance.navigatorKey,
                builder: (context, child) {
                  return MultiBlocListener(listeners: [
                    // BlocListener<AuthenticationBloc, AuthenticationState>(
                    //     listener: (context, state) {
                    //   switch (state.status) {
                    //     case AuthenticationStatus.authenticated:
                    //       NavigationService.instance.navigateTo(HomeRoute);
                    //       break;
                    //     case AuthenticationStatus.unauthenticated:
                    //       NavigationService.instance.navigateTo(LoginRoute);
                    //       break;
                    //     default:
                    //       break;
                    //   }
                    // }),
                    BlocListener<InternetCubit, InternetState>(
                        listener: (context, state) {
                      if (state is InternetConnected) {
                        print('Internet is conneted and have internet access');
                      } else if (state is InternetNotAccessible) {
                        print(
                            'Internet is conneted and but have no internet access');
                      } else {
                        print('No Internet connection');
                      }
                    })
                  ], child: child!);
                },
                initialRoute: splashRoute);
          },
        ),
      ),
    );
  }
}
