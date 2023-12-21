import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class DocumentWidget extends StatelessWidget {
  const DocumentWidget({
    Key? key,
    this.image = '',
    this.name = '',
    this.onPress,
  }) : super(key: key);

  final String name;
  final String image;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
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
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(
              name,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: onPress,
              child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 100,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
          ])),
    );
  }
}
