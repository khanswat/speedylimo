import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomLinearGradientWidget extends StatelessWidget {
  const CustomLinearGradientWidget({
    Key? key,
    this.firstText = '',
    this.lastText = '',
    this.fontSize,
    this.enable = true,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  final String firstText;
  final String lastText;
  final double? fontSize;
  final bool enable;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: TextStyle(
              color: tempColor.blackColor,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
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
                  text: TextSpan(
                    text: lastText,
                    style: TextStyle(
                      fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf',
                      fontSize: 2.5+fontSize!,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))),
      ],
    );
  }
}
