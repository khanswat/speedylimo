import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

class D_CancellRidesScreen extends StatefulWidget {
  const D_CancellRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_CancellRidesScreen> createState() => _D_CancellRidesScreenState();
}

class _D_CancellRidesScreenState extends State<D_CancellRidesScreen> {
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
              title1: 'Cancelled',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return D_CancleAndCompleteWidget(
              passengerName: 'Ali Atta (driver)',
              pickupTime: '12:04 pm 23/01/04',
              status: 'STATUS: CANCELLED',
              onTap: () {
                NavigationService.instance
                    .navigateTo(driverCancelledRidesDetail);
              },
              onTap1: () {
                NavigationService.instance
                    .navigateTo(driverCancelledRidesDetail);
              },
            );
          },
        ));
  }
}
