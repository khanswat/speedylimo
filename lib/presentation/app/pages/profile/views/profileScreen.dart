import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/extensions/extension.dart';
import 'package:speedylimo/utils/constants/app/app_constants.dart';
import '../../../../../business_logic/bussiness.logic.dart';
import '/presentation/presentation.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = context.read<UserCubit>().state.userData?.user;
    nameController.text = data?.name ?? '';
    emailController.text = data?.email ?? '';
    phoneController.text = data?.phoneNumber ?? '';

    return Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
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
                padding: EdgeInsets.all(14.0),
                child: Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.all(20),
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
                          imagePath: 'login'.png,
                          icon: Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 25.0,
                          ),
                          iconBackgroundColor: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          hint: 'Enter Your Name',
                          labelText: 'Enter Your Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                          controller: nameController,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: emailController,
                          hint: 'Enter Email@ address',
                          labelText: 'Enter Email',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          controller: phoneController,
                          hint: 'Enter Your Phone Number(Optional)',
                          labelText: 'Enter Your Phone Number',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Enter Your Account Number',
                          labelText: 'Enter Your Account Number',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Enter Your Bank Name',
                          labelText: 'Enter Your Bank Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Enter Your Branch Name',
                          labelText: 'Enter Your Branch Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                            childWidget: Text(
                              'Update'.toUpperCase(),
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
