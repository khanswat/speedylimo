import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import '/presentation/presentation.dart';
import '../../../../widgets/Widget.dart';
import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool revenueclr = true;
  bool budgetclr = true;
  bool _obscureText = true;

  final list = [
    'Passenger',
    'Driver',
  ];
  var dvaluel = 'Passenger';
  bool select = false;

  var imageUni8;

  pickImage(ImageSource gallery) async {
    try {
      final t = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (t == null) return;
      final imageTemporary = File(t.path);
      imageUni8 = imageTemporary.readAsBytesSync();
      String paths = imageTemporary.path;
      print("pphhhh" + paths);
      // Navigator.of(context).pop();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "lib/assets/icons/login.png",
                  ),
                  fit: BoxFit.fill,
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken)),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     //todo revenue card
                    //     Flexible(
                    //       child: Card(
                    //         elevation: 10,
                    //         color: const Color(0xffEFEFEF),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(0),
                    //         ),
                    //         child: TextFormField(
                    //             decoration: InputDecoration(
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(0)),
                    //         )),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //   children: [
                    //     //todo revenue card
                    //     Flexible(
                    //       child: Card(
                    //         elevation: 10,
                    //         color: const Color(0xffEFEFEF),
                    //         shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(0),
                    //         ),
                    //         child: TextFormField(
                    //             decoration: InputDecoration(
                    //           border: OutlineInputBorder(
                    //               borderRadius: BorderRadius.circular(0)),
                    //         )),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(20),
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
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'SIGN',
                                style: TextStyle(
                                    color: tempColor.blackColor,
                                    fontSize: 26,
                                    fontWeight: FontWeight.w600,
                                    fontFamily:
                                        'lib/assets/font/AbrilFatface-Regular.ttf'),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Center(
                                  child: ShaderMask(
                                      shaderCallback: (Rect bounds) {
                                        return const LinearGradient(
                                          colors: [
                                            Colors.blue,
                                            Color(0xff00C6FF)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ).createShader(bounds);
                                      },
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'UP',
                                          style: TextStyle(
                                            fontFamily:
                                                'lib/assets/font/AbrilFatface-Regular.ttf',
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ))),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
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
                          const TextFieldWidget(
                            withLabel: true,
                            hint: 'Name',
                            labelText: 'Name',
                            fillColor: Color(0xffEFEFEF),
                            validatation: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextFieldWidget(
                            withLabel: true,
                            hint: 'Email Address',
                            labelText: 'Email Address',
                            fillColor: Color(0xffEFEFEF),
                            validatation: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const TextFieldWidget(
                            withLabel: true,
                            keyboardType: TextInputType.phone,
                            hint: 'Phone Number',
                            labelText: 'Phone Number',
                            fillColor: Color(0xffEFEFEF),
                            validatation: true,
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            withLabel: true,
                            hint: 'Password',
                            labelText: 'Password',
                            fillColor: Color(0xffEFEFEF),
                            validatation: true,
                            obscureText: _obscureText,
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey),
                            ),
                            labelStyle: TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldWidget(
                            withLabel: true,
                            hint: 'Confirm Password',
                            labelText: 'Confirm Password',
                            fillColor: Color(0xffEFEFEF),
                            validatation: true,
                            obscureText: _obscureText,
                            icon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                              child: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey),
                            ),
                            labelStyle: const TextStyle(color: Colors.black),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                              child: dvaluel == 'Driver'
                                  ? Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: const FilePickerWidget(
                                            title: "CNIC Front Side",
                                            icons: "lib/assets/icons/idp.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: const FilePickerWidget(
                                            title: "CNIC Back Side",
                                            icons: "lib/assets/icons/idp.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: const FilePickerWidget(
                                            title:
                                                "Driving License  Front Side",
                                            icons: "lib/assets/icons/idp.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: const FilePickerWidget(
                                            title: "Partner Photo",
                                            icons: "lib/assets/icons/idp.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            pickImage(ImageSource.gallery);
                                          },
                                          child: const FilePickerWidget(
                                            title: "Vehicle Registration Book",
                                            icons: "lib/assets/icons/idp.png",
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        )
                                      ],
                                    )
                                  : null),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonWidget(
                              cornerRadius: 5.0,
                              key: const Key('loginForm_continue_raisedButton'),
                              childWidget: Text(
                                'REGISTER',
                                style: TextStyle(
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {}),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
