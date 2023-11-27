import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminPendingridesScreen extends StatefulWidget {
  const AdminPendingridesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminPendingridesScreen> createState() =>
      _AdminPendingridesScreenState();
}

class _AdminPendingridesScreenState extends State<AdminPendingridesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Pending',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(10),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              // border: Border.all(
                              //   color: tempColor.lightGreyColor,
                              //   // Border color for the outline
                              //   width: 1.5, // Border width for the outline
                              // ),
                            ),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.white,
                              child: Center(
                                  child: TextFormField(
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                  ),
                                  prefixIcon: Icon(Icons.search),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.blue, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                ),
                              )),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3, // The number of items in the list
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    // Build and return each item based on its index
                    return AdminPendinRideWidget(
                      orderid: '67',
                      passengerName: 'Asad( Passenger )',
                      rideType: 'Point to point',
                      dateTime: '1970-01-01',
                      paymentStatus: '1',
                      view: GestureDetector(
                        onTap: () {
                          NavigationService.instance
                              .navigateTo(adminPendingRideDetail);
                        },
                        child: CircleAvatar(
                          radius: 17.0,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.white,
                            size: 27,
                          ),
                        ),
                      ),
                      onPressed: () {
                        NavigationService.instance
                            .navigateTo(adminPendingRideDetail);
                      },
                    );
                  }),
            ),
          ],
        ));
  }
}
