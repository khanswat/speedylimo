import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';
import 'package:speedylimo/utils/utils.dart';
import '/business_logic/cubits/cubits.dart';

import '/presentation/presentation.dart';

class MyRidesScreen extends StatefulWidget {
  const MyRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MyRidesScreen> createState() => _MyRidesScreenState();
}

class _MyRidesScreenState extends State<MyRidesScreen> {
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
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'My',
              title2: 'Rides',
              name: '',
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
                  return MyRidesWidget(
                    pickupTime: data[index].pickupTime ?? '',
                    rideId: '#${data[index].id ?? ''}',
                    status: data[index].status == 0
                        ? 'Pending'.toUpperCase()
                        : 'Active'.toUpperCase(),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return MyRideDetailScreen(data: data[index]);
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
