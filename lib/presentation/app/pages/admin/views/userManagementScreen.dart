import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class UserManagementScreen extends StatefulWidget {
  const UserManagementScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserManagementScreen> createState() => _UserManagementScreenState();
}

class _UserManagementScreenState extends State<UserManagementScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            NavigationService.instance.navigateTo(createNewUserScreen);
          },
          child: Center(
              child: Icon(
            Icons.add,
            size: 35,
          )),
        ),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Users',
              title2: 'Management',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: Column(
          children: [
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Container(
            //           margin: const EdgeInsets.all(15.0),
            //           padding: const EdgeInsets.all(10),
            //           decoration: BoxDecoration(
            //             border: Border.all(
            //               color: tempColor.lightGreyColor,
            //               style: BorderStyle.solid,
            //               width: 1.5,
            //             ),
            //             color: tempColor.whiteColor,
            //             borderRadius: BorderRadius.circular(5.0),
            //           ),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width,
            //             height: 40,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               color: Colors.white,
            //               // border: Border.all(
            //               //   color: tempColor.lightGreyColor,
            //               //   // Border color for the outline
            //               //   width: 1.5, // Border width for the outline
            //               // ),
            //             ),
            //             child: Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 const SizedBox(
            //                   width: 5,
            //                 ),
            //                 Expanded(
            //                     child: ButtonWidget(
            //                   onPressed: () {
            //                     NavigationService.instance
            //                         .navigateTo(createNewUserScreen);
            //                   },
            //                   childWidget: Text(
            //                     'CREATE NEW USER',
            //                     style: TextStyle(
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.bold,
            //                         fontSize: 14),
            //                   ),
            //                 )),
            //                 const SizedBox(
            //                   width: 10,
            //                 ),
            //                 Expanded(
            //                   child: Container(
            //                     height: 40,
            //                     width: MediaQuery.of(context).size.width,
            //                     color: Colors.white,
            //                     child: Center(
            //                         child: TextFormField(
            //                       textAlign: TextAlign.start,
            //                       style: const TextStyle(
            //                         color: Colors.black,
            //                       ),
            //                       decoration: InputDecoration(
            //                         hintText: 'Search',
            //                         contentPadding: EdgeInsets.zero,
            //                         hintStyle: TextStyle(
            //                           color: Colors.grey,
            //                         ),
            //                         prefixIcon: Icon(Icons.search),
            //                         focusedBorder: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(10),
            //                           borderSide: const BorderSide(
            //                               color: Colors.blue, width: 1.0),
            //                         ),
            //                         enabledBorder: OutlineInputBorder(
            //                           borderRadius: BorderRadius.circular(10),
            //                           borderSide: const BorderSide(
            //                               color: Colors.grey, width: 1.0),
            //                         ),
            //                       ),
            //                     )),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           )),
            //     ],
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 20, right: 20),
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ),
                  color: HexColor('#BADEFE'),
                ),
                labelColor: tempColor.blackColor,
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
                unselectedLabelColor: tempColor.greyColor,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Passenger List',
                  ),
                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: 'Driver List',
                  ),
                ],
              ),
            ),
            // tab bar view here
            SizedBox(
              height: 20,
            ),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: NeverScrollableScrollPhysics(),
                children: [PassengerListScreen(), DriverListScreen()],
              ),
            ),
          ],
        ));
  }
}
