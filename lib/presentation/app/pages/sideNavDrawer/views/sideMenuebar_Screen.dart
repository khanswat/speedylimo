import 'package:flutter/material.dart';

import 'package:speedylimo/presentation/widgets/buttonWidget/button.widget.dart';

import 'package:speedylimo/utils/constants/constants.dart';

import '../../../../../services/navigation/navigation_service.dart';

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

  String profilePicLink = "";
  var uids;
  String url = "";
  bool status = false;
  @override
  Widget build(BuildContext context) {
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
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: const CircleAvatar(
                          radius: 45.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(
                            "lib/assets/icons/login.png",
                          )),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Ali (Passenger)",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.yellow, Colors.amber],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.explore,
                      color: Colors.white,
                    ),
                    title: const Text('passenget dash bord'),
                    onTap: () => {Navigator.of(context).pop()},
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.heart_broken,
                      color: Colors.black,
                    ),
                    title: const Text('My Rides'),
                    onTap: () => NavigationService.instance.navigateTo(myride),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.heart_broken,
                      color: Colors.black,
                    ),
                    title: const Text('Accepted Rides'),
                    onTap: () =>
                        NavigationService.instance.navigateTo(acceptedRides),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.heart_broken,
                      color: Colors.black,
                    ),
                    title: const Text('Cancelled Rides'),
                    onTap: () =>
                        NavigationService.instance.navigateTo(cancellRides),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.view_list,
                      color: Colors.black,
                    ),
                    title: const Text('Completed Rides'),
                    onTap: () =>
                        NavigationService.instance.navigateTo(completeRides),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                    title: const Text('Change Password'),
                    onTap: () => NavigationService.instance
                        .navigateTo(changePasswordRoute),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.power_settings_new_outlined,
                      color: Colors.black,
                    ),
                    title: const Text('Logout'),
                    onTap: () => NavigationService.instance
                        .navigateTo(changePasswordRoute),
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
              Column(
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    title: const Text('Admin dashbord'),
                    onTap: () =>
                        NavigationService.instance.navigateTo(adminHome),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    title: const Text('driver dashbord'),
                    onTap: () =>
                        NavigationService.instance.navigateTo(driverHome),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
