import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminCanceledRidesScreen extends StatefulWidget {
  const AdminCanceledRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminCanceledRidesScreen> createState() =>
      _AdminCanceledRidesScreenState();
}

class _AdminCanceledRidesScreenState extends State<AdminCanceledRidesScreen> {
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
              title: false,
              titlename: '',
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: CustomLinearGradientWidget(
                                  firstText: 'Canceled',
                                  lastText: 'Rides',
                                  fontSize: 18,
                                )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                      ),
                                    )),
                                  ),
                                ),
                              ],
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
                    return AdminCanceledRideWidget(
                      orderid: '58',
                      passengerName: 'Naveed Ullah (Passenger)',
                      Cancelledby: 'Ali Atta (driver)',
                      rideType: 'Point to point',
                      driverName: 'Ali Atta (driver)',
                      paymentStatus: '1',
                      Actions: GestureDetector(
                        onTap: () {
                          NavigationService.instance
                              .navigateTo(adminCanceledRideDetail);
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
                            .navigateTo(adminCanceledRideDetail);
                      },
                    );
                  }),
            ),
          ],
        ));
  }
}
