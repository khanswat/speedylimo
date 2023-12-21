import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class AdminCanceledRidesScreen extends StatefulWidget {
  const AdminCanceledRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AdminCanceledRidesScreen> createState() =>
      _AdminCanceledRidesScreenState();
}

class _AdminCanceledRidesScreenState extends State<AdminCanceledRidesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CancelRideCubit>().getCancelRideList();
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
              title1: 'Canceled',
              title2: 'Rides',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: BlocBuilder<CancelRideCubit, CancelRideState>(
          builder: (context, state) {
            if (state is CancelRideInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CancelRidesLoaded) {
              final data = state.cancelRidesData;
              return ListView.builder(
                  itemCount: data.length, // The number of items in the list
                  itemBuilder: (context, index) {
                    // Build and return each item based on its index
                    return AdminCanceledRideWidget(
                      orderid: '${data[index].id ?? ''}',
                      passengerName: data[index].usertype?.name ?? '',
                      Cancelledby: '${data[index].cancelledBy ?? ''}',
                      rideType: data[index].bookingType == '1'
                          ? 'As Directed'
                          : 'Point To Point',
                      driverName: data[index].usertypeDriver?.name ?? '',
                      paymentStatus: data[index].paymentStatus ?? '',
                      view: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return AdminCanceledRideDetailScreen(
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
                            size: 27,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return AdminCanceledRideDetailScreen(
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
