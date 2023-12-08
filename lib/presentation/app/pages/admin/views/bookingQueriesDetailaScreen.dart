import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/data/data.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';

// ignore: camel_case_types
class BookingQueriesDetailScreen extends StatefulWidget {
  final BookingQueryData data;
  const BookingQueriesDetailScreen({
    required this.data,
    Key? key,
  }) : super(key: key);

  @override
  State<BookingQueriesDetailScreen> createState() =>
      _BookingQueriesDetailScreenState();
}

class _BookingQueriesDetailScreenState
    extends State<BookingQueriesDetailScreen> {
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
        body: SingleChildScrollView(
          child: BookingQueriesDetailWidget(
            name: '${widget.data.firstName} ${widget.data.lastName}',
            EmailAddress: widget.data.email ?? '',
            PhoneNo: '+1 (464) 859-6386',
            ContactMethod: 'phone',
            CompanyName: 'Baird Conway LLC',
            ContactEmail: 'kugexozy@mailinator.com',
            RequestDetail: 'Excepteur velit tem',
            Summary: 'Qui aut eos esse vol',
            datetime: '2022-11-04 08:25:37',
            File: Container(
              child: Row(children: [
                Image.asset(
                  'lib/assets/icons/pdf.png',
                  color: Colors.blue,
                  scale: 12,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    ' Click me to Open',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ]),
            ),
          ),
        ));
  }
}
