import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/data/data.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class MyRideDetailScreen extends StatefulWidget {
  final MyRidesData data;
  const MyRideDetailScreen({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<MyRideDetailScreen> createState() => _MyRideDetailScreenState();
}

class _MyRideDetailScreenState extends State<MyRideDetailScreen> {
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
                padding: EdgeInsets.all(14.0),
                child: BookingDetailWidget(
                  bookingType: widget.data.asDirected ?? '',
                  droffTime: widget.data.time ?? '',
                  drpOffLocstion: widget.data.dropoffLocation ?? '',
                  estDistance: '${widget.data.totalTripMiles ?? ''} miles',
                  estDriveTime: widget.data.totalTripTime ?? '',
                  noBages: widget.data.bags ?? '',
                  noPassenger: widget.data.passenger ?? '',
                  passengerName: '${widget.data.usertype?.name} (Passenger)',
                  pickupLocation: widget.data.pickupLocation ?? '',
                  pickupTime: widget.data.pickupTime ?? '',
                  specialInstructions: widget.data.specialInstruction ?? '',
                  totslAmount: 'USD ${widget.data.totalTripAmount ?? ''}',
                  tripType: widget.data.bookingType == '2'
                      ? 'As Directed'
                      : 'Point To Point',
                  rideStatus: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue,
                        style: BorderStyle.solid,
                        width: 1.5,
                      ),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(2),
                      child: Text(
                        widget.data.status == 0 ? 'Pending' : 'Active',
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
