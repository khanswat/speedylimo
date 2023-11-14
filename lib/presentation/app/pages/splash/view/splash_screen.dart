import 'package:flutter/material.dart';

import '../../../../../data/data.dart';
import '../../../../../services/services.dart';
import '/utils/utils.dart';

import '../../../../../utils/constants/app/app_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool _isUserSignedIn = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  SharedPrefs _sharedPrefs = SharedPrefs();
  @override
  void initState() {
    super.initState();
    _sharedPrefs.isUserSignedIn().then(
      (value) {
        _isUserSignedIn = value;
        setState(() {
          Future.delayed(const Duration(seconds: 2), () {
            NavigationService.instance.navigateTo(loginRoute);
          });
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tempColor.whiteColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'splash'.gif,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

// gotoNext() {
//   if (UserSecureStorage.deletefield() == true) {
//     NavigationService.instance.navigateTo(LoginRoute);
//   } else {
//     NavigationService.instance.navigateTo(HomeRoute);
//   }
// }
