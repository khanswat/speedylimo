import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedylimo/data/data.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';
import 'package:speedylimo/utils/utils.dart';

import '/presentation/presentation.dart';

class DocumentScreen extends StatefulWidget {
  final AdminDriverData data;
  const DocumentScreen({super.key, required this.data});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  bool showSuffix = false;
  bool _obscureText = true;
  String baseurl = 'https://myspeedylimo.com/';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Driver',
              title2: 'Documents',
              name: '',
            )),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: tempColor.whiteColor, // Image radius
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://myspeedylimo.com/${widget.data.driverDocs!.partnerPhoto}',
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.data.name ?? '',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 14),
                ),
                DocumentWidget(
                  name: 'Cnic Front',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.cnicFront}',
                  onPress: () {},
                ),
                DocumentWidget(
                  name: 'Cnic Back',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.cnicBack}',
                  onPress: () {},
                ),
                DocumentWidget(
                  name: 'Driving License',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.drivingLicense}',
                  onPress: () {},
                ),
                DocumentWidget(
                  name: 'Vehicle Registration Book',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.vehicleRegBook}',
                  onPress: () {},
                ),
              ],
            ),
          ),
        ));
  }
}
