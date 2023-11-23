// ignore_for_file: unnecessary_new

import 'dart:ui';
import '../../../data/data.dart';
import '../../../utils/constants/app/app_constants.dart';
import '/services/services.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../presentation.dart';

// ignore: must_be_immutable
class DialogWiget extends StatefulWidget {
  final String content;
  VoidCallback onTap;
  final String postiveButtonText;
  final String negetiveButtonText;

  BuildContext contextt;

  DialogWiget(
      {Key? key,
      required this.content,
      required this.contextt,
      required this.negetiveButtonText,
      required this.postiveButtonText,
      required this.onTap})
      : super(key: key);

  @override
  State<DialogWiget> createState() => _DialogWigetState();
}

class _DialogWigetState extends State<DialogWiget> {
  final SharedPrefs _sharedPrefs = SharedPrefs();
  void logout() async {
    await _sharedPrefs.deleteToken();
  }

  @override
  void initState() {
    super.initState();
    // context.read<LogoutCubit>().getlogout();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
        contentPadding: EdgeInsets.all(12.0),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                widget.content,
                textAlign: TextAlign.center,
                style: TextStyle(color: tempColor.blackColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 40,
                    width: 80,
                    child: ButtonWidget(
                      isOutline: true,
                      childWidget: Text(
                        widget.negetiveButtonText,
                        style: TextStyle(
                            color: tempColor.blueColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => NavigationService.instance.goBack(),
                    ),
                  ),
                  Container(
                      height: 40,
                      width: 80,
                      child: ButtonWidget(
                          childWidget: Text(
                            widget.postiveButtonText,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: widget.onTap)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // showdialoge(context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ProgressDialogWiget();
  //       });
  // }
}
