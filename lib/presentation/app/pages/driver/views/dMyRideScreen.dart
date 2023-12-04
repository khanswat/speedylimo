import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';

import '/utils/utils.dart';

class D_MyRidesScreen extends StatefulWidget {
  const D_MyRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_MyRidesScreen> createState() => _D_MyRidesScreenState();
}

class _D_MyRidesScreenState extends State<D_MyRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<MyRidesCubit>().getMyRidesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'My',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: BlocBuilder<MyRidesCubit, MyRidesState>(
          builder: (context, state) {
            if (state is MyRidesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MyRidesLoaded) {
              final data = state.myRidesData;
              return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return D_MyRideWidget(
                      pickupTime: data[index].pickupTime ?? '',
                      passengerName: data[index].usertype?.name ?? '',
                      onTap: () {},
                      onTap1: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return D_BookingDetailScreen(data: data[index]);
                          },
                        ));
                      },
                      acceptRide: BlocConsumer<MyRidesCubit, MyRidesState>(
                        listener: (BuildContext context, Object? state) {
                          if (state is DriverAcceptError) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  backgroundColor: tempColor.redColor,
                                  content: Text(state.message!),
                                ),
                              );
                          }
                          if (state is DriverAcceptLoaded) {
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(
                                SnackBar(
                                  backgroundColor: tempColor.blueColor,
                                  content: Text('Ride Accepted!!!'),
                                ),
                              );
                          }
                        },
                        builder: (context, state) {
                          if (state is DriverAcceptLoading) {
                            return Center(
                              child: Container(
                                height: 30,
                                width: 30,
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else {
                            return InkWell(
                              onTap: () {
                                context
                                    .read<MyRidesCubit>()
                                    .getDriverAccept(rideID: data[index].id)
                                    .then((value) =>
                                        NavigationService.instance.goBack());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.green,
                                    style: BorderStyle.solid,
                                    width: 1.5,
                                  ),
                                  color: tempColor.whiteColor,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: const Center(
                                      child: Text(
                                    'CLICK TO ACCEPT',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        fontFamily:
                                            'lib/assets/font/AbrilFatface-Regular.ttf'),
                                  )),
                                ),
                              ),
                            );
                          }
                        },
                      ));
                },
              );
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_outlined,
                        color: Colors.amber,
                        size: 60,
                      ),
                      Text(
                        'No rides available for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: tempColor.blackColor),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
