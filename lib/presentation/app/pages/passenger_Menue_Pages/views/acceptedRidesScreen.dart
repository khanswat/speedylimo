import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/Widget.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

class AcceptedRidesScreen extends StatefulWidget {
  const AcceptedRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AcceptedRidesScreen> createState() => _AcceptedRidesScreenState();
}

class _AcceptedRidesScreenState extends State<AcceptedRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: false,
              title: false,
              titlename: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return AcceptedRidesWidget(
              driverName: 'Ali Atta (driver)',
              rideID: '#63',
              pickupTime: '12:04 pm 23/01/04',
              time: '12:04 pm 23/01/04',
              totalAmount: "0",
              onTap: () {
                NavigationService.instance.navigateTo(acceptedRidesDetail);
              },
              onTap1: () {},
              onTap2: () {},
            );
          },
        ));
  }
}
