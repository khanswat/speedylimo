import 'dart:io';
import '../../../../widgets/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedylimo/presentation/presentation.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import '../../../../widgets/widget.dart';

class GetSupportScreen extends StatefulWidget {
  const GetSupportScreen({Key? key}) : super(key: key);

  @override
  State<GetSupportScreen> createState() => _GetSupportScreenState();
}

class _GetSupportScreenState extends State<GetSupportScreen> {
  TextEditingController emailController = TextEditingController();
  bool showSuffix = false;
  int _selectedValue = 1;
  final list = [
    'Booking',
    'Driver',
  ];
  var dvaluel = 'Booking';

  var imageUni8;
  var Paths;

  pickImage(ImageSource gallery) async {
    try {
      final t = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (t == null) return;
      final imageTemporary = File(t.path);
      setState(() => imageUni8 = imageTemporary.readAsBytesSync());
      String paths = imageTemporary.path;
      print("pphhhh" + paths);
      Paths = File(t.path);
      // Navigator.of(context).pop();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      if (emailController.text.isEmpty) {
        showSuffix = false;
      } else {
        showSuffix = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            leading: IconButton(
                icon: const Icon(
                  Icons.filter_1,
                  color: Colors.transparent,
                ),
                onPressed: () {
                  // Do something
                }),
            floating: true,
            // snap: true,
            // elevation: 50,
            backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: CustomLinearGradientWidget(
                  firstText: 'Get',
                  lastText: 'Support',
                  fontSize: 30,
                ),
              ),
              background: Image.asset(
                "lib/assets/icons/abput1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  //todo email form
                  Column(children: [
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.t,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          // ignore: avoid_unnecessary_containers
                          Container(
                            child: const CustomLinearGradientWidget(
                              firstText: 'Book a',
                              lastText: 'limo Now',
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            "Need a quote? You are our number one priority. Get in touch now to book the right limo and make your occasion",
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.greyColor,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffEFEFEF),
                            border: Border.all(
                              color: tempColor.lightGreyColor,
                              // Border color for the outline
                              width: 1.5, // Border width for the outline
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              DropDownWidget(
                                  list: list.toList(),
                                  onChange: (value) {
                                    setState(() {
                                      dvaluel = value!;
                                    });
                                  },
                                  dvaluel: dvaluel),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Your email address*',
                          labelText: 'Your email address*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'First Name*',
                          labelText: 'First Name*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Last Name*',
                          labelText: 'Last Name*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Phone no*',
                          labelText: 'Phone no*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const CustomLinearGradientWidget(
                          lastText: "PREFERRED CONTACT METHOD:",
                          fontSize: 20,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 1,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                            ),
                            const Text("Email"),
                            Radio(
                              value: 2,
                              groupValue: _selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  _selectedValue = value!;
                                });
                              },
                            ),
                            const Text("Phone"),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Company Name*',
                          labelText: 'Company Name',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Summary*',
                          labelText: 'Summary*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          color: const Color(0xffEFEFEF),
                          child: const TextField(
                            maxLines: null, // Set this
                            expands: true, // and this
                            keyboardType: TextInputType.multiline,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                            decoration: InputDecoration(
                              hintText: 'Details of request or Issue*',
                              labelStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      Color(0xffEFEFEF), // Change border color
                                ),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        // border: Border.all(
                        //   color: tempColor.t,
                        //   style: BorderStyle.solid,
                        //   width: 1.5,
                        // ),
                        color: tempColor.whiteColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              pickImage(ImageSource.gallery);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.blackColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: tempColor.whiteColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: imageUni8 == null
                                  ? Column(
                                      children: [
                                        const Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.blue,
                                          size: 100,
                                        ),
                                        const Text(
                                          "ATTACHMENTS & SCREEN SHOTS or Drop file here",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 14),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(9.0),
                                      child: Image.memory(
                                        imageUni8,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                            "Accepted file types: jpg, jpeg, gif, png, pdf, webp, webm, heif, hevc, Max. file size: 5 MB, Max. files: 5. To expedite your request, please include a screen shot of the issue you had (if possible).",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonWidget(
                              cornerRadius: 5.0,
                              key: const Key('loginForm_continue_raisedButton'),
                              childWidget: Text(
                                'SUBMIT',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ]),
                ],
              );
            },
            childCount: 1,
          )),
        ],
      ),
    );
  }
}
