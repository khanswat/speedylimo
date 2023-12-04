import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

class D_CompletedRidesScreen extends StatefulWidget {
  const D_CompletedRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_CompletedRidesScreen> createState() => _D_CompletedRidesScreenState();
}

class _D_CompletedRidesScreenState extends State<D_CompletedRidesScreen> {
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
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Completed',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
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
                  return D_CancleAndCompleteWidget(
                    passengerName: data[index].usertype?.name ?? '',
                    pickupTime: data[index].pickupTime ?? '',
                    status: 'STATUS: COMPLETED',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return D_CompleteRideDetailScreen(data: data[index]);
                        },
                      ));
                    },
                    onTap1: () {},
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
