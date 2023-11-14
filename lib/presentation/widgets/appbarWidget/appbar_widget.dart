import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:speedylimo/extensions/extension.dart';
import '../../../utils/constants/app/app_constants.dart';

class AppBarWidget extends StatefulWidget {
  final bool isshow;
  final String name;
  final bool showback;
  final bool title;
  final String titlename;
  const AppBarWidget(
      {Key? key,
      required this.isshow,
      required this.name,
      required this.title,
      required this.titlename,
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
          colors: [Colors.yellow, Colors.amber],
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  widget.showback
                      ? SizedBox(
                          width: 40,
                          child: ElevatedButton(
                              clipBehavior: Clip.none,
                              // style: ButtonStyle(
                              //     shape: MaterialStateProperty.all<
                              //             RoundedRectangleBorder>(
                              //         RoundedRectangleBorder(
                              //             borderRadius:
                              //                 BorderRadius.circular(15.0),
                              //             side: BorderSide(
                              //                 color: Colors.white)))),
                              style: TextButton.styleFrom(
                                shadowColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                padding: EdgeInsets.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Center(
                                  child: Icon(
                                Icons.arrow_circle_left,
                                size: 35,
                              ))),
                        )
                      : Container(),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "lib/assets/icons/Group 1530.png",
                      ),
                      widget.title
                          ? Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: Text(
                                widget.titlename,
                                style: TextStyle(
                                  color: tempColor.whiteColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          : Container()
                    ],
                  )
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
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                      ],
                    )
                  : Container()
            ],
          ),
        ],
      ),
    );

    // if (value == 3) {
    //   NavigationService.instance.navigateTo(ChangePasswordRoute);
  }
}
