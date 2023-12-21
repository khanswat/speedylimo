import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
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
            PhoneNo: widget.data.phoneNo ?? '',
            ContactMethod: widget.data.contactMethod ?? '',
            CompanyName: widget.data.companyName ?? '',
            ContactEmail: widget.data.contact ?? '',
            RequestDetail: widget.data.requestDetail ?? '',
            Summary: widget.data.summary ?? '',
            datetime: DateFormat('yyyy-MM-dd HH:mm:ss')
                .format(DateTime.parse('${widget.data.createdAt ?? ''}')),
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
