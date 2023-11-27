import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return D_CancleAndCompleteWidget(
              passengerName: 'Ali Atta (driver)',
              pickupTime: '12:04 pm 23/01/04',
              status: 'STATUS: COMPLETED',
              onTap: () {
                NavigationService.instance
                    .navigateTo(driverCompleteRidesDetail);
              },
              onTap1: () {
                NavigationService.instance
                    .navigateTo(driverCompleteRidesDetail);
              },
            );
          },
        ));
  }
}
