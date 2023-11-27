import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: CircleAvatar(
                          radius: 45.0,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage('login'.png)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      ' ${data?.name ?? ''}',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ],
                ),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Color(0xff00C6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                        ),
                        title: const Text(
                          'My Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () =>
                            NavigationService.instance.navigateTo(myride),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                        ),
                        title: const Text(
                          'Accepted Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => NavigationService.instance
                            .navigateTo(acceptedRides),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                        ),
                        title: const Text(
                          'Cancelled Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () =>
                            NavigationService.instance.navigateTo(cancellRides),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                        ),
                        title: Text(
                          'Completed Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => NavigationService.instance
                            .navigateTo(completeRides),
                      ),
                    ],
                  ),
                  ListTile(
                    leading: Image.asset(
                      'changePass'.png,
                      height: 30,
                    ),
                    title: const Text(
                      'Change Password',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    onTap: () => NavigationService.instance
                        .navigateTo(changePasswordRoute),
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.logout_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    title: const Text('Logout'),
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
