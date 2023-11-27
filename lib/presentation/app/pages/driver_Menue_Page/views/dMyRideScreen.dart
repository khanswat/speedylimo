import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return D_MyRideWidget(
              pickupTime: '05:23am',
              passengerName: 'Asad(Passenger)',
              onTap: () {
                NavigationService.instance.navigateTo(driverMyRidesDetails);
              },
              onTap1: () {
                NavigationService.instance.navigateTo(driverMyRidesDetails);
              },
              onTap2: () {},
            );
          },
        ));
  }
}
