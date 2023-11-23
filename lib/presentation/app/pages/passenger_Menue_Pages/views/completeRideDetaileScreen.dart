import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class CompleteRideDetailScreen extends StatefulWidget {
  const CompleteRideDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CompleteRideDetailScreen> createState() =>
      _CompleteRideDetailScreenState();
}

class _CompleteRideDetailScreenState extends State<CompleteRideDetailScreen> {
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
                        color: Colors.amber,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: const Center(
                      child: Text(
                        ' Completed',
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
