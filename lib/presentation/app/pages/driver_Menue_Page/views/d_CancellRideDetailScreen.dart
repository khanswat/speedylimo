import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class D_CancellRideDetailScreen extends StatefulWidget {
  const D_CancellRideDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_CancellRideDetailScreen> createState() =>
      _D_CancellRideDetailScreenState();
}

class _D_CancellRideDetailScreenState extends State<D_CancellRideDetailScreen> {
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
              title1: 'Booking',
              title2: 'Detail',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: BookingDetailWidget(
                  bookingType: ' Point to point',
                  droffTime: '',
                  drpOffLocstion: 'Magni labore ea aper',
                  estDistance: '6.835081 miles',
                  estDriveTime: 'h 0 m 23 s 2',
                  noBages: ' 2',
                  noPassenger: ' 2',
                  passengerName: ' Asad ( Passenger )',
                  pickupLocation: 'Dubai - United Arab Emirates',
                  pickupTime: ' 05:23 am 23/01/05',
                  specialInstructions: 'Dolore soluta lorem',
                  totslAmount: 'USD 100',
                  tripType: 'As directed',
                  rideStatus: Container(
                    width: 130,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        ' Cancelled Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ))));
  }
}
