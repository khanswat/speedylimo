import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:speedylimo/presentation/widgets/timepickerWidget/timePicker.dart';
import '../../../../widgets/timepickerWidget/datepickerWidget.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class PassengerHomeScreen extends StatefulWidget {
  const PassengerHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PassengerHomeScreen> createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     //todo revenue card
                //     Flexible(
                //       child: Card(
                //         elevation: 10,
                //         color: const Color(0xffEFEFEF),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(0),
                //         ),
                //         child: TextFormField(
                //             decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(0)),
                //         )),
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                //   children: [
                //     //todo revenue card
                //     Flexible(
                //       child: Card(
                //         elevation: 10,
                //         color: const Color(0xffEFEFEF),
                //         shape: RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(0),
                //         ),
                //         child: TextFormField(
                //             decoration: InputDecoration(
                //           border: OutlineInputBorder(
                //               borderRadius: BorderRadius.circular(0)),
                //         )),
                //       ),
                //     )
                //   ],
                // ),
                Container(
                  margin: const EdgeInsets.all(15.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tempColor.lightGreyColor,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    color: tempColor.whiteColor,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'BOOK',
                            style: TextStyle(
                                color: tempColor.blackColor,
                                fontSize: 26,
                                fontWeight: FontWeight.w600,
                                fontFamily:
                                    'lib/assets/font/AbrilFatface-Regular.ttf'),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Center(
                              child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return const LinearGradient(
                                      colors: [Colors.blue, Color(0xff00C6FF)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ).createShader(bounds);
                                  },
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'NOW',
                                      style: TextStyle(
                                        fontFamily:
                                            'lib/assets/font/AbrilFatface-Regular.ttf',
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ))),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextFieldWidget(
                        withLabel: true,
                        hint: 'FROM*',
                        labelText: 'FROM*',
                        fillColor: Color(0xffEFEFEF),
                        validatation: true,
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextFieldWidget(
                        withLabel: true,
                        hint: 'TO*',
                        labelText: 'TO*',
                        fillColor: Color(0xffEFEFEF),
                        validatation: true,
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const DatePickerWidget(),
                      const SizedBox(
                        height: 20,
                      ),
                      TimePickerWidget(
                        fillColor: const Color(0xffEFEFEF),
                        size: 15,
                        borderColor: tempColor.lightGreyColor,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ButtonWidget(
                          cornerRadius: 5.0,
                          key: const Key('loginForm_continue_raisedButton'),
                          childWidget: Text(
                            'BOOK NOW',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            NavigationService.instance.navigateTo(bookNow);
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
