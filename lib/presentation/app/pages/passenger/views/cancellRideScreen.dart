import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/utils/utils.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class CancellRidesScreen extends StatefulWidget {
  const CancellRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CancellRidesScreen> createState() => _CancellRidesScreenState();
}

class _CancellRidesScreenState extends State<CancellRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<CancelRideCubit>().getCancelRideList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Cancelled',
              title2: 'Rides',
              name: '',
            )),
        body: BlocBuilder<CancelRideCubit, CancelRideState>(
          builder: (context, state) {
            if (state is CancelRideInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CancelRidesLoaded) {
              final data = state.cancelRidesData;
              return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return CancleAndCompleteWidget(
                    driverName: data[index].usertypeDriver?.name ?? '',
                    pickupTime: data[index].pickupTime ?? '',
                    totalAmount: 'USD ${data[index].totalTripAmount ?? ''}',
                    status: 'Cancelled'.toUpperCase(),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CancellRideDetailScreen(data: data[index]);
                        },
                      ));
                    },
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
