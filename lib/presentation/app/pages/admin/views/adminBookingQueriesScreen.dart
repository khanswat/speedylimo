import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class BookingQueriesScreen extends StatefulWidget {
  const BookingQueriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<BookingQueriesScreen> createState() => _BookingQueriesScreenState();
}

class _BookingQueriesScreenState extends State<BookingQueriesScreen> {
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
              title2: 'Queries',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: ListView.builder(
            itemCount: 3, // The number of items in the list
            itemBuilder: (
              context,
              index,
            ) {
              // Build and return each item based on its index
              return BookingQueriesWidget(
                name: 'Privacy Policy',
                EmailAddress: 'hylurowy@mailinator.com',
                PhoneNo: '+1 (464) 859-6386',
                dateTime: '2022-11-04 08:25:37',
                onPressed: () {
                  NavigationService.instance.navigateTo(bookingQueriesDetail);
                },
              );
            }));
  }
}
