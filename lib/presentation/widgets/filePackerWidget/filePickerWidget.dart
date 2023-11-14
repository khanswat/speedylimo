import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({
    Key? key,
    this.controller,
    this.title = '',
    this.icons = '',
    this.ontap,
    this.prefixIcon,
    this.fillColor,
    this.hint,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? ontap;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? hint;
  final String title;
  final String icons;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xffEFEFEF),
          border: Border.all(
            color: tempColor.lightGreyColor,
            // Border color for the outline
            width: 1.5, // Border width for the outline
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(title),
              const SizedBox(
                height: 20.0,
              ),
              Image.asset(
                icons,
                scale: 3,
              )
              // ElevatedButton(
              //   onPressed: () => _selectDate(context),
              //   child: const Text('Select date'),
              // ),
            ],
          ),
        ),
      ),
    ]);
  }
}
