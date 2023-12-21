import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../services/services.dart';
import '../../../../../../utils/constants/app/app_constants.dart';
import '../../../../../utils/utils.dart';
import '../../pages.dart';

class SignupMainScreen extends StatefulWidget {
  const SignupMainScreen({super.key});

  @override
  State<SignupMainScreen> createState() => _SignupMainScreenState();
}

class _SignupMainScreenState extends State<SignupMainScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
              image: AssetImage(
                'login'.png,
              ),
              fit: BoxFit.cover,
              colorFilter:
                  const ColorFilter.mode(Colors.black45, BlendMode.darken)),
        ),
        child: Center(
          child: Container(
            height: 500,
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
                // give the tab bar a height [can change height to preferred height]
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'SIGN',
                      style: TextStyle(
                          color: tempColor.blackColor,
                          fontSize: 22,
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
                                text: 'UP',
                                style: TextStyle(
                                  fontFamily:
                                      'lib/assets/font/AbrilFatface-Regular.ttf',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ))),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ),
                  ),
                  child: TabBar(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: HexColor('#BADEFE'),
                    ),
                    labelColor: tempColor.blackColor,
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, letterSpacing: 1),
                    unselectedLabelColor: tempColor.greyColor,
                    tabs: [
                      // first tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Passenger',
                      ),
                      // second tab [you can add an icon using the icon property]
                      Tab(
                        text: 'Driver',
                      ),
                    ],
                  ),
                ),
                // tab bar view here
                SizedBox(
                  height: 20,
                ),

                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: NeverScrollableScrollPhysics(),
                    children: [SignupScreen(), SignupScreenDriver()],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
