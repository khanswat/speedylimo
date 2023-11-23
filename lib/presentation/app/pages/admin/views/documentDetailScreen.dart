import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../services/navigation/navigation_service.dart';
import '/presentation/presentation.dart';
import '/utils/constants/app/app_constants.dart';

import '/utils/utils.dart';

class DocumentDetailScreen extends StatefulWidget {
  const DocumentDetailScreen({super.key});

  @override
  State<DocumentDetailScreen> createState() => _DocumentDetailScreenState();
}

class _DocumentDetailScreenState extends State<DocumentDetailScreen> {
  bool showSuffix = false;
  bool _obscureText = true;
  var imageUni8;
  var Paths;

  Future<void> pickImage(ImageSource gallery) async {
    try {
      final t = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (t == null) return;
      final imageTemporary = File(t.path);
      setState(() => imageUni8 = imageTemporary.readAsBytesSync());
      var paths = imageTemporary.path;
      print('pphhhh' + paths);
      Paths = File(t.path);
      // Navigator.of(context).pop();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

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
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              title: false,
              titlename: '',
              name: '',
            )),
        body: Column(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: tempColor.lightGreyColor,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              // border: Border.all(
                              //   color: tempColor.lightGreyColor,
                              //   // Border color for the outline
                              //   width: 1.5, // Border width for the outline
                              // ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: CustomLinearGradientWidget(
                                  firstText: 'Driver',
                                  lastText: 'Documents',
                                  fontSize: 25,
                                )),
                              ],
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 3, // The number of items in the list
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    // Build and return each item based on its index
                    return DocumentDetailWidget(
                      name: 'Naveed Ullah',
                      image: 'lib/assets/icons/login.png',
                      onPress: () {},
                      onPress1: () {},
                      onPress2: () {
                        NavigationService.instance
                            .navigateTo(editNewUserScreen);
                      },
                      onPress3: () {
                        showCanceldialoge();
                      },
                    );
                  }),
            ),
          ],
        ));
  }

  Future showCanceldialoge() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWiget(
            content: 'Do you want to Delete?',
            postiveButtonText: 'Yes',
            negetiveButtonText: 'No',
            contextt: context,
            onTap: () {},
          );
        });
  }
}
