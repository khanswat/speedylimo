import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class D_AcceptedRidesScreen extends StatefulWidget {
  const D_AcceptedRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_AcceptedRidesScreen> createState() => _D_AcceptedRidesScreenState();
}

class _D_AcceptedRidesScreenState extends State<D_AcceptedRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<AcceptedRidesCubit>().getAcceptedRideList();
  }

  @override
  void didChangeDependencies() {
    BlocProvider.of<AcceptedRidesCubit>;
    super.didChangeDependencies();
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
              title1: 'Accepted',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: BlocBuilder<AcceptedRidesCubit, AcceptedRidesState>(
          builder: (context, state) {
            if (state is AcceptedRidesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AcceptedRidesLoaded) {
              final data = state.acceptedRidesData;
              return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return D_AcceptedRidesWidget(
                    passengerName: data[index].usertype?.name ?? '',
                    rideID: '#${data[index].id ?? ''}',
                    pickupTime: data[index].pickupTime ?? '',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return D_AcceptedRideDetailScreen(data: data[index]);
                        },
                      ));
                    },
                    cancelWidget:
                        BlocConsumer<AcceptedRidesCubit, AcceptedRidesState>(
                      listener: (BuildContext context, Object? state) {
                        if (state is PassengerCancelError) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                backgroundColor: tempColor.redColor,
                                content: Text(state.message),
                              ),
                            );
                        }
                        if (state is PassengerCancelLoaded) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                backgroundColor: tempColor.blueColor,
                                content: Text('Ride Cancelled!!!'),
                              ),
                            );
                        }
                      },
                      builder: (context, state) {
                        if (state is PassengerCancelLoading) {
                          return Center(
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.red,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: tempColor.whiteColor,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                    child: Text(
                                  'CANCEL RIDE',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: tempColor.blackColor),
                                )),
                              ),
                            ),
                            onTap: () {
                              context
                                  .read<AcceptedRidesCubit>()
                                  .getPassengerCancel(rideID: data[index].id)
                                  .then(
                                    (value) =>
                                        NavigationService.instance.goBack(),
                                  );
                            },
                          );
                        }
                      },
                    ),
                    completeWidget:
                        BlocConsumer<AcceptedRidesCubit, AcceptedRidesState>(
                      listener: (BuildContext context, Object? state) {
                        if (state is PassengerCompleteError) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                backgroundColor: tempColor.redColor,
                                content: Text(state.message),
                              ),
                            );
                        }
                        if (state is PassengerCompleteLoaded) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                              SnackBar(
                                backgroundColor: tempColor.blueColor,
                                content: Text('Ride Cancelled!!!'),
                              ),
                            );
                        }
                      },
                      builder: (context, state) {
                        if (state is PassengerCompleteLoading) {
                          return Center(
                            child: Container(
                              height: 30,
                              width: 30,
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return GestureDetector(
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
                                child: Center(
                                    child: Text(
                                  'COMPLETED RIDE',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: tempColor.blackColor),
                                )),
                              ),
                            ),
                            onTap: () {
                              context
                                  .read<AcceptedRidesCubit>()
                                  .getPassengerComplete(rideID: data[index].id)
                                  .then(
                                    (value) =>
                                        NavigationService.instance.goBack(),
                                  );
                            },
                          );
                        }
                      },
                    ),
                  );
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
