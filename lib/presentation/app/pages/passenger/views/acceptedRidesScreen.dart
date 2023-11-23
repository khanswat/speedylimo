import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

class AcceptedRidesScreen extends StatefulWidget {
  const AcceptedRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AcceptedRidesScreen> createState() => _AcceptedRidesScreenState();
}

class _AcceptedRidesScreenState extends State<AcceptedRidesScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  @override
  void initState() {
    super.initState();
    context.read<AcceptedRidesCubit>().getAcceptedRideList();
  }

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
        body: BlocBuilder<AcceptedRidesCubit, AcceptedRidesState>(
          builder: (context, state) {
            if (state is AcceptedRidesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is AcceptedRidesLoaded) {
              final data = state.acceptedRidesData;
              return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return AcceptedRidesWidget(
                    driverName: data[index].usertypeDriver?.name ?? '',
                    rideID: '${data[index].usertype?.id}',
                    pickupTime: data[index].pickupTime ?? '',
                    time: data[index].time ?? '',
                    status: 'Ongoing'.toUpperCase(),
                    totalAmount: 'USD ${data[index].totalTripAmount ?? ''}',
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return AcceptedRideDetailScreen(data: data[index]);
                        },
                      ));
                    },
                    onTapCancel: () {},
                    onTapcomplete: () {},
                  );
                },
              );
            } else {
              return Container();
            }
          },
        ));
  }
}
