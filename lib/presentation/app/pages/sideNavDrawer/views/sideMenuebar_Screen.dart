import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';
import '../../../../../business_logic/cubits/cubits.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../widgets/Widget.dart';
import '/utils/utils.dart';

class NavDrawer extends StatefulWidget {
  const NavDrawer(BuildContext context, {super.key});

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  // ignore: prefer_typing_uninitialized_variables
  var imageUni8;
  var sindex = 0;
  final List storedocs = [];

  String profilePicLink = '';
  var uids;
  String url = '';
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final data = context.read<UserCubit>().state.userData?.user;
    return Form(
        key: _formKey,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                // ignore: sort_child_properties_last
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          'login'.png,
                        ),
                        colorFilter: const ColorFilter.mode(
                            Colors.black45, BlendMode.darken),
                        fit: BoxFit.fill)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.directions_car_filled_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                    title: const Text(
                      'My Rides',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    onTap: () =>
                        NavigationService.instance.navigateTo(allRides),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.grey,
                      size: 25,
                    ),
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    onTap: () {
                      showCanceldialoge();
                    },
                  ),
                ],
              ),
              // Column(
              //   children: [
              //     ListTile(
              //       leading: const Icon(
              //         Icons.lock,
              //         color: Colors.white,
              //       ),
              //       title: const Text('Driver dashbord'),
              //       onTap: () => {Navigator.of(context).pop()},
              //     ),
              //     ListTile(
              //       leading: const Icon(
              //         Icons.heart_broken,
              //         color: Colors.black,
              //       ),
              //       title: const Text('My Rides'),
              //       onTap: () =>
              //           NavigationService.instance.navigateTo(driverMyRide),
              //     ),
              //     ListTile(
              //       leading: const Icon(
              //         Icons.heart_broken,
              //         color: Colors.black,
              //       ),
              //       title: const Text('Accepted Rides'),
              //       onTap: () => NavigationService.instance
              //           .navigateTo(driverAcceptedRides),
              //     ),
              //     ListTile(
              //       leading: const Icon(
              //         Icons.heart_broken,
              //         color: Colors.black,
              //       ),
              //       title: const Text('Cancelled Rides'),
              //       onTap: () => NavigationService.instance
              //           .navigateTo(driverCancelledRides),
              //     ),
              //     ListTile(
              //       leading: const Icon(
              //         Icons.view_list,
              //         color: Colors.black,
              //       ),
              //       title: const Text('Completed Rides'),
              //       onTap: () => NavigationService.instance
              //           .navigateTo(driverCompltetRides),
              //     ),
              //     ListTile(
              //       leading: const Icon(
              //         Icons.lock,
              //         color: Colors.black,
              //       ),
              //       title: const Text('Change Password'),
              //       onTap: () => NavigationService.instance
              //           .navigateTo(changePasswordRoute),
              //     ),
              //   ],
              // ),
              data!.roles![0].name != 'Passenger'
                  ? ListTile(
                      leading: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      title: const Text('Admin dashbord'),
                      onTap: () =>
                          NavigationService.instance.navigateTo(adminHome),
                    )
                  : Container(),
              data.roles![0].name != 'Passenger'
                  ? ListTile(
                      leading: const Icon(
                        Icons.lock,
                        color: Colors.white,
                      ),
                      title: const Text('driver dashbord'),
                      onTap: () =>
                          NavigationService.instance.navigateTo(driverHome),
                    )
                  : Container(),
            ],
          ),
        ));
  }

  Future showCanceldialoge() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWiget(
            content: 'Do you want to logout?',
            postiveButtonText: 'Yes',
            negetiveButtonText: 'No',
            contextt: context,
            onTap: () {
              // context.read<LogoutCubit>().getlogout();
              context.read<UserCubit>().logout();

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Successfully Logout'),
                  ),
                );
              NavigationService.instance.pushAndRemoveUntil(loginRoute);
            },
          );
        });
  }
}
