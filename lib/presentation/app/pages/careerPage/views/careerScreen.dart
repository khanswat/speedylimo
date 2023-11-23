import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedylimo/presentation/presentation.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class CareerScreen extends StatefulWidget {
  const CareerScreen({Key? key}) : super(key: key);

  @override
  State<CareerScreen> createState() => _CareerScreenState();
}

class _CareerScreenState extends State<CareerScreen> {
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

  Future<void> pickImage(ImageSource gallery) async {
    try {
      final t = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (t == null) return;
      final imageTemporary = File(t.path);
      setState(() => imageUni8 = imageTemporary.readAsBytesSync());
      String paths = imageTemporary.path;
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
                  firstText: 'Career',
                  lastText: '.',
                  fontSize: 30,
                ),
              ),
              background: Image.asset(
                'lib/assets/icons/abput1.png',
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
                          Container(
                            child: const CustomLinearGradientWidget(
                              firstText: 'Career Application',
                              lastText: 'Form',
                              fontSize: 25,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'We are always in need of driver',
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
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Title*',
                          labelText: 'Title*',
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
                          hint: 'Your Email Address*',
                          labelText: 'Your Email Address*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          withLabel: true,
                          hint: 'Phone No*',
                          labelText: 'Phone No*',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 15,
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
                              hintText: 'Insert Cover Letter Here...',
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Driver Permit Expiration Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          //  DatePickerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Upload Driver Permit'),
                          const SizedBox(
                            height: 10,
                          ),
                          CareerFileWidget(
                            fileText: 'No file chose',
                            buttonText: 'Choose File',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Vehicle Permit Expiration Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          // const DatePickerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Upload Vehicle Permit'),
                          const SizedBox(
                            height: 10,
                          ),
                          CareerFileWidget(
                            fileText: 'No file chose',
                            buttonText: 'Choose File',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Vehicle Registration code'),
                          const SizedBox(
                            height: 10,
                          ),
                          // const DatePickerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Upload Vehicle Registration'),
                          const SizedBox(
                            height: 10,
                          ),
                          CareerFileWidget(
                            fileText: 'No file chose',
                            buttonText: 'Choose File',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Certificate of insurance'),
                          const SizedBox(
                            height: 10,
                          ),
                          // const DatePickerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Copy of drug test'),
                          const SizedBox(
                            height: 10,
                          ),
                          CareerFileWidget(
                            fileText: 'No file chose',
                            buttonText: 'Choose File',
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Driver Permit Expiration Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          // const DatePickerWidget(),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Upload Driver Permit'),
                          const SizedBox(
                            height: 10,
                          ),
                          CareerFileWidget(
                            fileText: 'No file chose',
                            buttonText: 'Choose File',
                            onPressed: () {},
                          )
                        ],
                      ),
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
                                          'Upload Your Resume Here',
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
