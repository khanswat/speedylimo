import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return D_AcceptedRidesWidget(
              passengerName: 'Ali Atta (driver)',
              rideID: '#63',
              pickupTime: '12:04 pm 23/01/04',
              onTap: () {
                NavigationService.instance.navigateTo(acceptedRidesDetail);
              },
              onTap1: () {
                NavigationService.instance.navigateTo(acceptedRidesDetail);
              },
              onTap2: () {},
              onTap3: () {},
            );
          },
        ));
  }
}
