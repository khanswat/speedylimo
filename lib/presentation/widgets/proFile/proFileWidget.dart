import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    this.controller,
    this.imagePath = '',
    this.iconBackgroundColor,
    this.icon,
    this.onTab,
    required this.onPressed,
    this.color,
  }) : super(key: key);

  final TextEditingController? controller;
  final Widget? icon;
  final GestureTapCallback onPressed;
  final Color? color;
  final Function? onTab;
  final Color? iconBackgroundColor;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Stack(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                border: Border.all(
                  color: color!,
                  width: 4.0,
                ),
              ),
              child: CircleAvatar(
                radius: 65,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 60.0,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    imagePath,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: InkWell(
                onTap: onPressed,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: iconBackgroundColor,
                  ),
                  child: icon,
                ),
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
