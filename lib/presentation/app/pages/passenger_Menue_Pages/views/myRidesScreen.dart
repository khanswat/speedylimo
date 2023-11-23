import 'package:flutter/material.dart';

import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: true,
              title: false,
              titlename: '',
              name: '',
            )),
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return MyRidesWidget(
              pickupTime: '05:23am',
              rideId: '#63',
              onTap: () {},
              onTap1: () {
                NavigationService.instance.navigateTo(bookingDetail);
              },
            );
          },
        ));
  }
}
