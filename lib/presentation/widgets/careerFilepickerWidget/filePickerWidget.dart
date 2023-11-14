import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CareerFileWidget extends StatelessWidget {
  const CareerFileWidget({
    Key? key,
    this.controller,
    required this.onPressed,
    this.fileText = '',
    this.buttonText = '',
    this.hintStyle,
    this.icon,
    this.prefixIcon,
    this.fillColor,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
    this.inputFormatter,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final String fileText;
  final String buttonText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final GestureTapCallback onPressed;
  final FilteringTextInputFormatter? inputFormatter;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffEFEFEF),
        border: Border.all(
          color: tempColor.lightGreyColor,
          // Border color for the outline
          width: 1.5, // Border width for the outline
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: InkWell(
              onTap: onPressed,
              child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Color(0xff00C6FF)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
                child: Center(
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 40,
            width: 1,
            color: Colors.black,
          ),
          Expanded(
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffEFEFEF),
              child: Center(
                  child: Text(
                fileText,
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.bold),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
