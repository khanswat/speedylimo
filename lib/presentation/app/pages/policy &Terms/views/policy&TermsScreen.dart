import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speedylimo/extensions/colors/colors_extension.dart';
import 'package:speedylimo/presentation/presentation.dart';

import 'package:speedylimo/presentation/widgets/appbarWidget/appbar_widget.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '../../sideNavDrawer/views/sideMenuebar_Screen.dart';

// ignore: camel_case_types
class policyTermsScreen extends StatefulWidget {
  const policyTermsScreen({super.key});

  @override
  State<policyTermsScreen> createState() => _policyTermsScreenState();
}

// ignore: camel_case_types
class _policyTermsScreenState extends State<policyTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: false,
              title: false,
              titlename: '',
              name: '',
            )),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: tempColor.t,
                //   style: BorderStyle.solid,
                //   width: 1.5,
                // ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  const CustomLinearGradientWidget(
                    firstText: 'TERM &',
                    lastText: 'CONDITIONS',
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      "Speedy Limo offers luxury transportation services at affordable rates through its vast range of stretch limos, SUVs, party buses, vans and sedans. Travelers rely on our services for executive rides, corporate meetings, parties and other events. Since its inception, Speedy Limo has transformed into a marvelous limousine service that is now set to beat your travel expectations so that you have a five-star experience.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                // border: Border.all(
                //   color: tempColor.t,
                //   style: BorderStyle.solid,
                //   width: 1.5,
                // ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: [
                  const CustomLinearGradientWidget(
                    firstText: 'PRIVACY',
                    lastText: 'POLICY',
                    fontSize: 30,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    child: const Text(
                      "Speedy Limo offers luxury transportation services at affordable rates through its vast range of stretch limos, SUVs, party buses, vans and sedans. Travelers rely on our services for executive rides, corporate meetings, parties and other events. Since its inception, Speedy Limo has transformed into a marvelous limousine service that is now set to beat your travel expectations so that you have a five-star experience.",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ));
  }
}
