import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../data/data.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminCanceledRideDetailScreen extends StatefulWidget {
  final CancelRideData data;
  const AdminCanceledRideDetailScreen({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<AdminCanceledRideDetailScreen> createState() =>
      _AdminCanceledRideDetailScreenState();
}

class _AdminCanceledRideDetailScreenState
    extends State<AdminCanceledRideDetailScreen> {
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
          child: AdminCanceledRideDetailWidget(
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
              Status: widget.data.status == 0 ? 'Cancelled' : 'Active',
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
