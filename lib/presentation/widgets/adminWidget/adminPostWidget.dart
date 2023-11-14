import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class AdmainPostWidget extends StatelessWidget {
  const AdmainPostWidget({
    Key? key,
    this.icons,
    this.text = '',
    this.fontSize,
    this.onPressed,
  }) : super(key: key);

  final String text;
  final Widget? icons;
  final double? fontSize;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(
            color: tempColor.lightGreyColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          gradient: const LinearGradient(
            colors: [Colors.blue, Color(0xff00C6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          color: tempColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(child: icons),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
