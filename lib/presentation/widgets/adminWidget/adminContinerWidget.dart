import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class AdmainContinerWidget extends StatelessWidget {
  const AdmainContinerWidget({
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
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.blue, Color(0xff00C6FF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          color: tempColor.whiteColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 1, child: Container(child: icons)),
            Expanded(
              flex: 2,
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
