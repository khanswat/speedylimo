import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../widgets/Widget.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/utils.dart';

class CancellRidesScreen extends StatefulWidget {
  const CancellRidesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CancellRidesScreen> createState() => _CancellRidesScreenState();
}

class _CancellRidesScreenState extends State<CancellRidesScreen> {
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
              showback: false,
              title: false,
              titlename: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: ListView.builder(
          itemCount: 3, // The number of items in the list
          itemBuilder: (context, index) {
            // Build and return each item based on its index
            return CancleAndCompleteWidget(
              driverName: 'Ali Atta (driver)',
              pickupTime: '12:04 pm 23/01/04',
              totalAmount: "0",
              status: "STATUS: CANCELLED",
              onTap: () {
                NavigationService.instance.navigateTo(cancellRidesDetails);
              },
            );
          },
        ));
  }
}
