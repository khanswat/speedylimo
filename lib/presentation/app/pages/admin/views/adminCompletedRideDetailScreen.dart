import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminCompletedRideDetailScreen extends StatefulWidget {
  const AdminCompletedRideDetailScreen({
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
            PassengerName: 'Naveed Ullah (Passenger)',
            Drivername: 'Ali Atta (driver)',
            Ridetype: 'Point to point',
            ExtraNote: 'Write some thinks..',
            PaymentID: '7T991655K36223211',
            PaymentStatus: '1',
            Passengers: '1',
            Bags: '1',
            Time: '07:41 pm 23/01/03',
            Status: 'Completed',
            Status1: 'Point to point',
            Status2: 'Point to point',
            PickUp: 'Model Colony Malir Cantonment, Karachi, Pakistan',
            DropOff:
                'Park Avenue, Shahrah-e-Faisal Road, Pakistan Employees Co-Operative Housing Society Block 6 PECHS, Karachi, Pakistan',
          ),
        ));
  }
}
