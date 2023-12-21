import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/extensions/extension.dart';
import '../../../../../business_logic/bussiness.logic.dart';
import '/presentation/presentation.dart';
import '/utils/constants/app/app_constants.dart';

class EditNewUserScreen extends StatefulWidget {
  const EditNewUserScreen({super.key});

  @override
  State<EditNewUserScreen> createState() => _EditNewUserScreenState();
}

class _EditNewUserScreenState extends State<EditNewUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();
  final list = [
    'Passenger',
    'Driver',
    'Admin',
    'Author',
  ];
  var dvaluel = 'Passenger';

  bool showSuffix = false;
  bool _obscureText = true;
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
    // nameController.text = data?.name ?? '';
    // emailController.text = data?.email ?? '';
    // phoneController.text = data?.phoneNumber ?? '';

    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: true,
              title1: '',
              title2: '',
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
                        CustomLinearGradientWidget(
                          firstText: 'Edit',
                          lastText: 'New User',
                          fontSize: 30,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldWidget(
                          hint: 'Name',
                          labelText: ' Name',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                          controller: nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Email',
                          labelText: 'Email',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Password',
                          labelText: 'Password',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                          controller: PasswordController,
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
                                color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFieldWidget(
                          hint: 'Confirm Password',
                          labelText: 'Confirm Password',
                          validatation: true,
                          labelStyle: TextStyle(color: Colors.black),
                          controller: ConfirmPasswordController,
                          obscureText: showSuffix,
                          icon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showSuffix = !showSuffix;
                              });
                            },
                            child: Icon(
                                showSuffix
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.blue),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 52,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: const Color(0xffEFEFEF),
                        //     border: Border.all(
                        //       color: tempColor.lightGreyColor,
                        //       // Border color for the outline
                        //       width: 1.5, // Border width for the outline
                        //     ),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       DropDownWidget(
                        //           list: list.toList(),
                        //           onChange: (value) {
                        //             setState(() {
                        //               dvaluel = value!;
                        //             });
                        //           },
                        //           dvaluel: dvaluel),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(
                          height: 10,
                        ),
                        ButtonWidget(
                            childWidget: const Text(
                              'SUBMIT',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            onPressed: () {})
                      ],
                    )))));
  }
}
