import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
  void initState() {
    super.initState();
    context.read<BookingQueriesCubit>().getBookingQueriesList();
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
              title1: 'Booking',
              title2: 'Queries',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: BlocBuilder<BookingQueriesCubit, BookingQueriesState>(
          builder: (context, state) {
            if (state is BookingQueriesInitial) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is BookingQueriesLoaded) {
              final data = state.bookingqueryData;
              return ListView.builder(
                  itemCount: data.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return BookingQueriesWidget(
                      name: '${data[index].firstName}${data[index].lastName}',
                      EmailAddress: data[index].email ?? '',
                      PhoneNo: data[index].phoneNo ?? '',
                      dateTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(
                          DateTime.parse('${data[index].createdAt ?? ''}')),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return BookingQueriesDetailScreen(
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
