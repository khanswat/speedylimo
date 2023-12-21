import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminPendingridesScreen extends StatefulWidget {
  const AdminPendingridesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminPendingridesScreen> createState() =>
      _AdminPendingridesScreenState();
}

class _AdminPendingridesScreenState extends State<AdminPendingridesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<MyRidesCubit>().getMyRidesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Pending',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: BlocBuilder<MyRidesCubit, MyRidesState>(
          builder: (context, state) {
            if (state is MyRidesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is MyRidesLoaded) {
              final data = state.myRidesData;
              return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    // Build and return each item based on its index
                    return AdminPendinRideWidget(
                      orderid: '${data[index].id ?? ''}',
                      passengerName: data[index].usertype?.name ?? '',
                      rideType: data[index].bookingType == '1'
                          ? 'As Directed'
                          : 'Point To Point',
                      dateTime: DateFormat('yyyy-MM-dd')
                          .format(DateTime.parse('${data[index].date ?? ''}')),
                      paymentStatus: data[index].paymentStatus ?? '',
                      view: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AdminPendingRideDetailScreen(
                                  data: data[index]);
                            },
                          ));
                        },
                        child: CircleAvatar(
                          radius: 17.0,
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AdminPendingRideDetailScreen(
                                data: data[index]);
                          },
                        ));
                      },
                    );
                  });
            } else {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.warning_amber_outlined,
                        color: Colors.amber,
                        size: 60,
                      ),
                      Text(
                        'No rides available for you',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: tempColor.blackColor),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
