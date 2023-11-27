import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class D_BookingDetailScreen extends StatefulWidget {
  const D_BookingDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<D_BookingDetailScreen> createState() => _D_BookingDetailScreenState();
}

class _D_BookingDetailScreenState extends State<D_BookingDetailScreen> {
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
                    width: 90,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        ' pending',
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
