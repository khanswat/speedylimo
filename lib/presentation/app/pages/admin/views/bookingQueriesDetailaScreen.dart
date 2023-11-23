import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class BookingQueriesDetailScreen extends StatefulWidget {
  const BookingQueriesDetailScreen({
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
              title: false,
              titlename: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tempColor.lightGreyColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    color: tempColor.whiteColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: const CustomLinearGradientWidget(
                    firstText: 'Booking',
                    lastText: 'Queries',
                    fontSize: 25,
                  ),
                ),
              ),
              BookingQueriesDetailWidget(
                name: 'Amber Bray',
                EmailAddress: 'hylurowy@mailinator.com',
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
                      scale: 13,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        ' click me to Open',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ]),
                ),
              ),
            ],
          ),
        ));
  }
}
