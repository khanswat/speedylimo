import 'package:flutter/material.dart';
import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class DocumentDetailWidget extends StatelessWidget {
  const DocumentDetailWidget({
    Key? key,
    this.image = '',
    this.name = '',
    this.onPress,
    this.onPress1,
    this.onPress2,
    this.onPress3,
  }) : super(key: key);

  final String name;
  final String image;
  final VoidCallback? onPress;
  final VoidCallback? onPress1;
  final VoidCallback? onPress2;
  final VoidCallback? onPress3;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            color: tempColor.lightGreyColor,
            style: BorderStyle.solid,
            width: 1.5,
          ),
          color: tempColor.whiteColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              height: 180,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: onPress,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: onPress2,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: onPress1,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.download,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
              SizedBox(
                width: 15,
              ),
              GestureDetector(
                onTap: onPress3,
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.red,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 27,
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
