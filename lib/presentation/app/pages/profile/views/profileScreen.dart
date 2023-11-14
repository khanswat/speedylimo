import 'package:flutter/material.dart';
import 'package:speedylimo/extensions/colors/colors_extension.dart';
import 'package:speedylimo/presentation/presentation.dart';
import 'package:speedylimo/presentation/widgets/appbarWidget/appbar_widget.dart';
import 'package:speedylimo/presentation/widgets/proFile/proFileWidget.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: false,
              title: false,
              titlename: '',
              name: '',
            )),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ProfileWidget(
                          color: Colors.grey,
                          imagePath: "lib/assets/icons/login.png",
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 25.0,
                          ),
                          iconBackgroundColor: Colors.white,
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Your Name",
                          labelText: 'Enter Your Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Email@ address",
                          labelText: 'Enter Email',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Your Phone Number(Optional)",
                          labelText: 'Enter Your Phone Number',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Your Account Number",
                          labelText: 'Enter Your Account Number',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Your Bank Name",
                          labelText: 'Enter Your Bank Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextFieldWidget(
                          hint: "Enter Your Branch Name",
                          labelText: 'Enter Your Branch Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                            childWidget: const Text(
                              "Update",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            onPressed: () {})
                      ],
                    )))));
  }
}
