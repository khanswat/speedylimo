import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/presentation/widgets/adminWidget/adminContinerWidget.dart';

import 'package:speedylimo/presentation/widgets/timepickerWidget/timePicker.dart';

import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  bool revenueclr = true;
  bool budgetclr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: false,
              title: false,
              titlename: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     //todo revenue card
                //     Flexible(
                //       child: Card(
                //         elevation: 10,
                //         color: const Color(0xffEFEFEF),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(0),
                //         ),
                //         child: TextFormField(
                //             decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(0)),
                //         )),
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     //todo revenue card
                //     Flexible(
                //       child: Card(
                //         elevation: 10,
                //         color: const Color(0xffEFEFEF),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(0),
                //         ),
                //         child: TextFormField(
                //             decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(0)),
                //         )),
                //       ),
                //     )
                //   ],
                // ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: const CustomLinearGradientWidget(
                              firstText: 'MY',
                              lastText: 'DASHBOARD',
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AdmainContinerWidget(
                        text: "POSTS",
                        icons: const Icon(Icons.menu_book_outlined,
                            color: Colors.white, size: 32),
                        onPressed: () {
                          NavigationService.instance.navigateTo(adminPost);
                        },
                      ),
                      AdmainContinerWidget(
                        text: "COLLECTION",
                        fontSize: 16,
                        icons: const Icon(Icons.collections,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "PAGES",
                        fontSize: 16,
                        icons: const Icon(Icons.bookmarks_rounded,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "BOOKING QUERIES",
                        fontSize: 16,
                        icons: const Icon(Icons.person,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "PENDING RIDES",
                        fontSize: 16,
                        icons: const Icon(Icons.double_arrow,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "ONGOING RIDES",
                        fontSize: 16,
                        icons: const Icon(Icons.double_arrow,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "CANCELED RIDES",
                        fontSize: 16,
                        icons: const Icon(Icons.person,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "COMPLETED RIDES",
                        fontSize: 16,
                        icons: const Icon(Icons.task_alt_rounded,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "CAREER",
                        fontSize: 16,
                        icons: const Icon(Icons.task_alt_rounded,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "USER MANAGEMENT",
                        fontSize: 16,
                        icons: const Icon(Icons.person,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "DOUCEMENTS",
                        fontSize: 16,
                        icons: const Icon(Icons.panorama,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                      AdmainContinerWidget(
                        text: "Logout",
                        fontSize: 16,
                        icons: const Icon(Icons.power_settings_new_outlined,
                            color: Colors.white, size: 32),
                        onPressed: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
