import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminPendingRideDetailScreen extends StatefulWidget {
  const AdminPendingRideDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminPendingRideDetailScreen> createState() =>
      _AdminPendingRideDetailScreenState();
}

class _AdminPendingRideDetailScreenState
    extends State<AdminPendingRideDetailScreen> {
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
          child: AdminPendingRideDetailWidget(
            PassengerName: 'Asad ( Passenger )',
            Drivername: 'Ali',
            Ridetype: 'Point to point',
            ExtraNote: '',
            PaymentID: '23C32842LV641400E',
            PaymentStatus: '1',
            Passengers: '1',
            Bags: '1',
            Time: '11:01 am 23/01/11',
            Status: 'pending',
            Status1: 'Point to point',
            Status2: 'Point to point',
            PickUp: 'Model Colony Malir Cantonment, Karachi, Pakistan',
            DropOff:
                'Park Avenue, Shahrah-e-Faisal Road, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi, Pakistan',
          ),
        ));
  }
}
