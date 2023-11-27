import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/utils.dart';

// ignore: camel_case_types
class ShowUserScreen extends StatefulWidget {
  const ShowUserScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ShowUserScreen> createState() => _ShowUserScreenState();
}

class _ShowUserScreenState extends State<ShowUserScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  String Name = 'Naveed Ulah';
  String Email = 'naveedullahhere@gmail.coggg';
  String Role = 'Passenger';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: true,
              title1: '',
              title2: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: const CustomLinearGradientWidget(
                firstText: 'Show',
                lastText: 'User',
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
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
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Text(
                            Name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Email:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Text(
                            Email,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Roles:',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.green,
                                style: BorderStyle.solid,
                                width: 1.5,
                              ),
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            height: 25,
                            width: 110,
                            child: Center(
                              child: Text(
                                Role,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
