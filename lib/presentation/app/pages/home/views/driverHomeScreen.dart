import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class DriverHomeScreen extends StatefulWidget {
  const DriverHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DriverHomeScreen> createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {
  bool revenueclr = true;
  bool budgetclr = true;

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
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: false,
              logo: true,
              title1: '',
              title2: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tempColor.lightGreyColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    color: tempColor.whiteColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.white,
                              backgroundImage: AssetImage(
                                'lib/assets/icons/login.png',
                              )),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Ali (Driver)',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              SizedBox(
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      status == true
                                          ? status = false
                                          : status = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    // ignore: deprecated_member_use
                                    primary: status == false
                                        ? Colors.green
                                        : Colors.grey,
                                  ),
                                  child: Text(
                                    status == false
                                        ? "YOU'RE ONLINE"
                                        : "YOU'RE OFFLINE",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),

                          // ignore: avoid_unnecessary_containers
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AdmainContinerWidget(
                          text: 'My Rides',
                          fontSize: 14,
                          icons: const Icon(Icons.heart_broken_rounded,
                              color: Colors.white, size: 25),
                          onPressed: () {
                            NavigationService.instance.navigateTo(driverMyRide);
                          }),
                      AdmainContinerWidget(
                        text: 'Accepted Rides',
                        fontSize: 14,
                        icons: const Icon(Icons.heart_broken_rounded,
                            color: Colors.white, size: 25),
                        onPressed: () => NavigationService.instance
                            .navigateTo(driverAcceptedRides),
                      ),
                      AdmainContinerWidget(
                        text: 'Cancelled Rides',
                        fontSize: 14,
                        icons: const Icon(Icons.heart_broken_rounded,
                            color: Colors.white, size: 25),
                        onPressed: () => NavigationService.instance
                            .navigateTo(driverCancelledRides),
                      ),
                      AdmainContinerWidget(
                        text: 'Completed Rides',
                        fontSize: 14,
                        icons: const Icon(Icons.view_list,
                            color: Colors.white, size: 25),
                        onPressed: () => NavigationService.instance
                            .navigateTo(driverCompltetRides),
                      ),
                      AdmainContinerWidget(
                        text: 'Change Password',
                        fontSize: 14,
                        icons: const Icon(Icons.lock,
                            color: Colors.white, size: 25),
                        onPressed: () => NavigationService.instance
                            .navigateTo(changePasswordRoute),
                      ),
                      AdmainContinerWidget(
                        text: 'Logout',
                        fontSize: 14,
                        icons: const Icon(Icons.power_settings_new_outlined,
                            color: Colors.white, size: 25),
                        onPressed: () {
                          showCanceldialoge();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
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
