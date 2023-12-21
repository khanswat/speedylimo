import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import '../../../../../business_logic/cubits/cubits.dart';
import '../../../../../data/data.dart';
import '../../../../../services/services.dart';
import '/presentation/presentation.dart';
import '../../../../widgets/Widget.dart';
import '/utils/utils.dart';

class SignupScreenDriver extends StatefulWidget {
  const SignupScreenDriver({
    Key? key,
  }) : super(key: key);

  @override
  State<SignupScreenDriver> createState() => _SignupScreenDriverState();
}

class _SignupScreenDriverState extends State<SignupScreenDriver> {
  bool _obscureText = true;
  var token;
  final SharedPrefs _sharedPrefs = SharedPrefs();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  String? vehicleinsurance;
  String? vehicleregistration;
  String? drivingLicense;
  String? photo;
  String? drugText;
  String? vehicleinsurancetext;
  String? vehicleregistrationtext;
  String? drivingLicensetext;
  String? phototext;
  String? drugTexttext;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  Future<String?> pickFile() async {
    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
      );

      if (result != null) {
        print(result.files.single.path);
        return result.files.single.path;
      }
    } catch (e) {
      print('Error picking file: $e');
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.status.isSubmissionFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                  content: Text(
                    state.errorMessage ?? 'Register Error',
                  ),
                ));
            }
            if (state.status.isSubmissionSuccess) {
              final data = context.read<LoginCubit>().state.userModel?.data!;
              context.read<UserCubit>().updateUser(data!);
              _sharedPrefs.setToken(data.token ?? '');
              NavigationService.instance.pushAndReplac(bottomBarRoute);
            }
          },
          child: RawScrollbar(
            thumbColor: HexColor('#118EF5'),
            radius: Radius.circular(15),
            thickness: 5,
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(right: 20),
                child: Column(
                  children: [
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return TextFieldWidget(
                          controller: nameController,
                          withLabel: true,
                          hint: 'Name',
                          labelText: 'Name',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          validator:
                              state.name.invalid ? 'Incorrect Name' : null,
                          onChanged: (name) => context
                              .read<LoginCubit>()
                              .nameChanged(name ?? ''),
                          labelStyle: TextStyle(color: Colors.black),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return TextFieldWidget(
                          controller: emailController,
                          withLabel: true,
                          hint: 'Email Address',
                          labelText: 'Email Address',
                          fillColor: Color(0xffEFEFEF),
                          labelStyle: TextStyle(color: Colors.black),
                          validatation: true,
                          validator:
                              state.email.invalid ? 'Incorrect Email' : null,
                          onChanged: (email) => context
                              .read<LoginCubit>()
                              .emailChanged(email ?? ''),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return TextFieldWidget(
                          controller: phoneController,
                          withLabel: true,
                          keyboardType: TextInputType.phone,
                          hint: 'Phone Number',
                          labelText: 'Phone Number',
                          fillColor: Color(0xffEFEFEF),
                          labelStyle: TextStyle(color: Colors.black),
                          validatation: false,
                          validator:
                              state.number.invalid ? 'Incorrect Number' : null,
                          onChanged: (number) => context
                              .read<LoginCubit>()
                              .numberChanged(number ?? ''),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        return TextFieldWidget(
                          controller: passwordController,
                          withLabel: true,
                          hint: 'Password',
                          labelText: 'Password',
                          fillColor: Color(0xffEFEFEF),
                          validatation: true,
                          validator:
                              state.password.invalid ? 'Incorrect Name' : null,
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
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        vehicleinsurance = await pickFile().then((value) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Vehicle Insurance Certificate Added Successfully',
                              ),
                            ));
                        });
                      },
                      child: FilePickerWidget(
                        title: 'Vehicle Insurance',
                        icons: 'lib/assets/icons/idp.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        vehicleregistration = await pickFile().then((value) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Vehicle Registration Added Successfully',
                              ),
                            ));
                        });
                      },
                      child: FilePickerWidget(
                        title: 'Vehicle Registration',
                        icons: 'lib/assets/icons/idp.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        drivingLicense = await pickFile().then((value) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Driving License Added Successfully',
                              ),
                            ));
                        });
                        ;
                      },
                      child: FilePickerWidget(
                        title: 'Driving License  Front Side',
                        icons: 'lib/assets/icons/idp.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        photo = await pickFile().then((value) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Profile Photo Added Successfully',
                              ),
                            ));
                        });
                        ;
                      },
                      child: FilePickerWidget(
                        title: 'Profile Photo',
                        icons: 'lib/assets/icons/idp.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        drugText = await pickFile().then((value) {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                              content: Text(
                                'Drug Test Added Successfully',
                              ),
                            ));
                        });
                        ;
                      },
                      child: FilePickerWidget(
                        title: 'Drug Test',
                        icons: 'lib/assets/icons/idp.png',
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //todo login Button
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status,
                      builder: (context, state) {
                        return ButtonWidget(
                            cornerRadius: 5.0,
                            key: const Key('loginForm_continue_raisedButton'),
                            isLoading: state.status.isSubmissionInProgress
                                ? false
                                : (!state.status.isSubmissionInProgress
                                    ? false
                                    : true),
                            isOutline: state.status.isSubmissionInProgress
                                ? true
                                : false,
                            height: 50,
                            childWidget: state.status.isSubmissionInProgress
                                ? const Center(
                                    child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator()),
                                  )
                                : Text(
                                    'REGISTER',
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                  ),
                            onPressed: () {
                              context
                                  .read<LoginCubit>()
                                  .registerDriverWithCredentials(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      password_confirm: passwordController.text,
                                      name: nameController.text,
                                      V_insurance: File(vehicleinsurance ?? ''),
                                      V_registration:
                                          File(vehicleregistration ?? ''),
                                      d_license: File(drivingLicense ?? ''),
                                      photo: File(photo ?? ''),
                                      drugText: File(drugText ?? ''),
                                      number: phoneController.text);
                            });
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    ));
  }
}
