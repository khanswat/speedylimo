import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';

import 'package:speedylimo/data/data.dart';
import 'package:speedylimo/services/navigation/navigation_service.dart';

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
                ClipRRect(
                  borderRadius: BorderRadius.circular(60.0),
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://myspeedylimo.com/${widget.data.driverDocs!.partnerPhoto}',
                    fit: BoxFit.fill,
                    height: 120,
                    width: 120,
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
                  name: 'vehicle Insurance',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.cnicFront}',
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => imageDialog(
                            'https://myspeedylimo.com/${widget.data.driverDocs?.cnicFront}',
                            context));
                  },
                  onDownload: () {
                    SaveImage(
                        url:
                            'https://myspeedylimo.com/${widget.data.driverDocs?.cnicFront}',
                        ext: 'webp',
                        name: 'Vehiccle Insurance');
                  },
                ),
                DocumentWidget(
                  name: 'Drug Test',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.cnicBack}',
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => imageDialog(
                            'https://myspeedylimo.com/${widget.data.driverDocs?.cnicBack}',
                            context));
                  },
                  onDownload: () {
                    SaveImage(
                        url:
                            'https://myspeedylimo.com/${widget.data.driverDocs?.cnicBack}',
                        ext: 'jpg',
                        name: 'Drug Test');
                  },
                ),
                DocumentWidget(
                  name: 'Driving License',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.drivingLicense}',
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => imageDialog(
                            'https://myspeedylimo.com/${widget.data.driverDocs?.drivingLicense}',
                            context));
                  },
                  onDownload: () {
                    SaveImage(
                        url:
                            'https://myspeedylimo.com/${widget.data.driverDocs?.drivingLicense}',
                        ext: 'webp',
                        name: 'Driving License');
                  },
                ),
                DocumentWidget(
                  name: 'Vehicle Registration',
                  image:
                      'https://myspeedylimo.com/${widget.data.driverDocs?.vehicleRegBook}',
                  onPress: () async {
                    await showDialog(
                        context: context,
                        builder: (_) => imageDialog(
                            'https://myspeedylimo.com/${widget.data.driverDocs?.vehicleRegBook}',
                            context));
                  },
                  onDownload: () {
                    SaveImage(
                        url:
                            'https://myspeedylimo.com/${widget.data.driverDocs?.vehicleRegBook}',
                        ext: 'png',
                        name: 'Vehicle Registration');
                  },
                ),
              ],
            ),
          ),
        ));
  }

  void SaveImage(
      {required String url, required String ext, required String name}) async {
    await FileSaver.instance
        .saveFile(
          name: name,
          link: LinkDetails(
            link: url,
          ),
          mimeType: MimeType.other,
          ext: ext,
        )
        .then((value) => ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(
            content: Text(
              'Download Successfully!!!',
            ),
          )));
  }

  Widget imageDialog(url, context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  NavigationService.instance.goBack();
                },
                icon: Icon(Icons.close_outlined),
                color: Colors.redAccent,
              ),
            ),
          ),
          Container(
            width: 250,
            height: 350,
            child: CachedNetworkImage(
              imageUrl: url,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
        ],
      ),
    );
  }
}
