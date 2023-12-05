import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

class CompleteRidesScreen extends StatefulWidget {
  const CompleteRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteRidesScreen> createState() => _CompleteRidesScreenState();
}

class _CompleteRidesScreenState extends State<CompleteRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<CompletedRidesCubit>().getCompletedRideList();
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
              title1: 'Completed',
              title2: 'Rides',
              name: '',
            )),
        body: BlocBuilder<CompletedRidesCubit, CompletedRidesState>(
          builder: (context, state) {
            if (state is CompletedRidesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CompletedRidesLoaded) {
              final data = state.completedRidesData;
              return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return CancleAndCompleteWidget(
                    driverName: data[index].usertypeDriver?.name ?? '',
                    pickupTime: data[index].pickupTime ?? '',
                    totalAmount: 'USD ${data[index].totalTripAmount ?? ''}',
                    status: 'COMPLETED'.toUpperCase(),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return CompleteRideDetailScreen(data: data[index]);
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
