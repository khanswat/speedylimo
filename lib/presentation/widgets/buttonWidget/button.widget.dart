import 'package:flutter/material.dart';

import '../../../extensions/colors/colors_extension.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.childWidget,
      required this.onPressed,
      this.cornerRadius = 12.0,
      this.height = 48.0,
      this.isLoading = false,
      this.isOutline = false})
      : super(key: key);

  final GestureTapCallback onPressed;
  final Widget childWidget;
  final double cornerRadius;
  final double height;
  final bool isLoading;
  final bool isOutline;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(cornerRadius),
        gradient: const LinearGradient(
          colors: [Colors.blue, Color(0xff00C6FF)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        border: Border.all(
          width: 1,
          color: isOutline == true
              ? (isLoading == true
                  ? Theme.of(context)
                      .colorScheme
                      .primaryContainer
                      .withOpacity(0.6)
                  : Theme.of(context).primaryColor)
              : Colors.transparent,
        ),
        color: isOutline == false
            ? (isLoading == true
                ? Theme.of(context).disabledColor
                : HexColor('#0D99FF'))
            : Colors.transparent,
      ),
      child: TextButton(
        key: key,

        onPressed: onPressed,
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cornerRadius),
        ))),

        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: childWidget,
            )
          ],
        ),
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(cornerRadius)),
      ),
    );
  }
}
