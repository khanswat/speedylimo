import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedylimo/extensions/extension.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class AppBarWidget extends StatefulWidget {
  final bool isshow;
  final String name;
  final bool showback;
  final bool logo;
  final String title1;
  final String title2;

  const AppBarWidget(
      {Key? key,
      required this.isshow,
      required this.name,
      required this.logo,
      required this.title1,
      required this.title2,
      required this.showback})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [Colors.blue, Color(0xff00C6FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.showback
                      ? SizedBox(
                          width: 30,
                          child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_rounded,
                                    size: 25,
                                    color: Colors.white,
                                  ))),
                        )
                      : Container(),
                ],
              ),
              widget.logo
                  ? Image.asset(
                      'lib/assets/icons/updatelogo.png',
                      scale: 1.8,
                    )
                  : Row(
                      children: [
                        Text(
                          widget.title1,
                          style: TextStyle(
                            color: tempColor.blackColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          widget.title2,
                          style: TextStyle(
                            color: tempColor.whiteColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
              widget.isshow
                  ? Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openEndDrawer();
                          },
                          child: SvgPicture.asset(
                            'menu'.svg,
                            height: 15,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );

    // if (value == 3) {
    //   NavigationService.instance.navigateTo(ChangePasswordRoute);
  }
}
