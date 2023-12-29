// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '/business_logic/cubits/cubits.dart';
import '/presentation/presentation.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class CallNowScreen extends StatefulWidget {
  const CallNowScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CallNowScreen> createState() => _CallNowScreenState();
}

class _CallNowScreenState extends State<CallNowScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  void launchwatsapp({@required number, @required Message}) async {
    // ignore: omit_local_variable_types
    var url = 'whatsapp://send?phone-$number@text-$Message';
    await canLaunch(url) ? launch(url) : print('cant open');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer:
            context.read<UserCubit>().state.userData?.user?.roles![0].name !=
                    'Passenger'
                ? null
                : NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: context
                          .read<UserCubit>()
                          .state
                          .userData
                          ?.user
                          ?.roles![0]
                          .name !=
                      'Passenger'
                  ? false
                  : true,
              showback: false,
              logo: true,
              title1: '',
              title2: '',
              name: context.read<UserCubit>().state.update_name ?? '',
            )),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomLinearGradientWidget(
                        firstText: 'Call',
                        lastText: 'Now',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Get in Touch',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() => launch(
                                'https://www.google.com/maps/search/?api=1&query='
                                '2624 Wilkinson Blvd. Charlotte, NC 28208')),
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Expanded(
                            child: Text(
                              textAlign: TextAlign.justify,
                              '2624 Wilkinson Blvd. Charlotte, NC 28208',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() => launch('tel:+17043766668')),
                            child: const Icon(
                              Icons.wifi_calling_3,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            '+17043766668',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.location_on,
                              color: Colors.blue,
                              size: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            'info@myspeedylimo.co',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            '© 2022 Speedy Limo. All rights reserved |',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 12),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          InkWell(
                            onTap: () {
                              NavigationService.instance
                                  .navigateTo(policyTerms);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Privacy Policy | Terms & Conditions',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                                const Icon(Icons.arrow_right),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    NavigationService.instance.navigateTo(aboutUs);
                  },
                  child: Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Learn About Speedy Limo',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    NavigationService.instance.navigateTo(getSupport);
                  },
                  child: Container(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Get Support',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        const Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     NavigationService.instance.navigateTo(careerRoot);
                //   },
                //   child: Container(
                //     margin: const EdgeInsets.all(15.0),
                //     padding: const EdgeInsets.all(20),
                //     decoration: BoxDecoration(
                //       border: Border.all(
                //         color: tempColor.lightGreyColor,
                //         style: BorderStyle.solid,
                //         width: 1.5,
                //       ),
                //       color: tempColor.whiteColor,
                //       borderRadius: BorderRadius.circular(5.0),
                //     ),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         // ignore: avoid_unnecessary_containers
                //         const Text(
                //           'CAREER',
                //           style: TextStyle(
                //               color: Colors.black,
                //               fontWeight: FontWeight.bold,
                //               fontSize: 14),
                //         ),
                //         const Icon(Icons.arrow_right),
                //       ],
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ));
  }
}
