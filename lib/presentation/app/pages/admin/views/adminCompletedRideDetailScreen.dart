import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/data.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

class AdminCompletedRideDetailScreen extends StatefulWidget {
  final CompletedRidesData data;
  const AdminCompletedRideDetailScreen({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<AdminCompletedRideDetailScreen> createState() =>
      _AdminCompletedRideDetailScreenState();
}

class _AdminCompletedRideDetailScreenState
    extends State<AdminCompletedRideDetailScreen> {
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
              title1: 'Ride',
              title2: 'Details',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
          child: AdminCompletedRideDetailWidget(
              PassengerName: widget.data.usertype?.name ?? '',
              Drivername: '',
              Ridetype: widget.data.bookingType == '1'
                  ? 'As Directed'
                  : 'Point To Point',
              ExtraNote: widget.data.specialInstruction ?? '',
              PaymentID: '${widget.data.paymentId ?? ''}',
              PaymentStatus: widget.data.paymentStatus ?? '',
              Passengers: widget.data.passenger ?? '',
              Bags: widget.data.bags ?? '',
              Time: widget.data.time ?? '',
              Status: widget.data.status == 0 ? 'Completed' : 'Active',
              Status1: widget.data.bookingType == '1'
                  ? 'As Directed'
                  : 'Point To Point',
              Status2: widget.data.bookingType == '1'
                  ? 'As Directed'
                  : 'Point To Point',
              PickUp: widget.data.pickupLocation ?? '',
              DropOff: widget.data.dropoffLocation ?? ''),
        ));
  }
}
