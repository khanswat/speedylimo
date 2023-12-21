import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:speedylimo/extensions/extension.dart';
import '../../../../../business_logic/bussiness.logic.dart';
import '../../../../../data/data.dart';
import '/presentation/presentation.dart';
import '/utils/constants/app/app_constants.dart';

class CreateNewUserScreen extends StatefulWidget {
  const CreateNewUserScreen({super.key});

  @override
  State<CreateNewUserScreen> createState() => _CreateNewUserScreenState();
}

class _CreateNewUserScreenState extends State<CreateNewUserScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final list = [
    'Passenger',
    'Driver',
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
    //final data = context.read<UserCubit>().state.userData?.user;
    // nameController.text = data?.name ?? '';
    // emailController.text = data?.email ?? '';
    // phoneController.text = data?.phoneNumber ?? '';

    return BlocProvider(
      create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
      child: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  state.errorMessage ?? 'Login Error',
                ),
              ));
          }
          if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'Created Successfully',
                ),
              ));
          }
        },
        child: Scaffold(
            appBar: const PreferredSize(
                preferredSize: Size.fromHeight(80),
                child: AppBarWidget(
                  isshow: false,
                  showback: true,
                  logo: true,
                  title1: '  ',
                  title2: ' ',
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
                              firstText: 'Create',
                              lastText: 'New User',
                              fontSize: 18,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return TextFieldWidget(
                                  controller: nameController,
                                  withLabel: true,
                                  hint: 'Name',
                                  labelText: 'Name',
                                  fillColor: Color(0xffEFEFEF),
                                  validatation: false,
                                  validator: state.name.invalid
                                      ? 'Incorrect Name'
                                      : null,
                                  onChanged: (name) => context
                                      .read<LoginCubit>()
                                      .nameChanged(name ?? ''),
                                  labelStyle: TextStyle(color: Colors.black),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
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
                                  validatation: false,
                                  validator: state.email.invalid
                                      ? 'Incorrect Email'
                                      : null,
                                  onChanged: (email) => context
                                      .read<LoginCubit>()
                                      .emailChanged(email ?? ''),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return TextFieldWidget(
                                  controller: phoneController,
                                  withLabel: true,
                                  hint: 'Phone Number',
                                  labelText: 'Phone Number',
                                  fillColor: Color(0xffEFEFEF),
                                  validatation: false,
                                  validator: state.password.invalid
                                      ? 'Incorrect number'
                                      : null,
                                  obscureText: false,
                                  labelStyle: TextStyle(color: Colors.black),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            BlocBuilder<LoginCubit, LoginState>(
                              builder: (context, state) {
                                return TextFieldWidget(
                                  controller: passwordController,
                                  withLabel: true,
                                  hint: 'Password',
                                  labelText: 'Password',
                                  fillColor: Color(0xffEFEFEF),
                                  validatation: false,
                                  validator: state.password.invalid
                                      ? 'Incorrect Name'
                                      : null,
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
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 53,
                              decoration: BoxDecoration(
                                color: tempColor.lightGreyColor1,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  // Border color for the outline
                                  width: 1.5, // Border width for the outline
                                ),
                              ),
                              child: DropDownWidget(
                                  list: list.toList(),
                                  onChange: (value) {
                                    setState(() {
                                      dvaluel = value!;
                                    });
                                  },
                                  dvaluel: dvaluel),
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
                                    key: const Key(
                                        'loginForm_continue_raisedButton'),
                                    isLoading: state
                                            .status.isSubmissionInProgress
                                        ? false
                                        : (!state.status
                                                    .isSubmissionInProgress &
                                                state.status.isValid
                                            ? false
                                            : true),
                                    isOutline: state
                                            .status.isSubmissionInProgress
                                        ? true
                                        : false,
                                    height: 50,
                                    childWidget:
                                        state.status.isSubmissionInProgress
                                            ? const Center(
                                                child: SizedBox(
                                                    height: 30,
                                                    width: 30,
                                                    child:
                                                        CircularProgressIndicator()),
                                              )
                                            : Text(
                                                dvaluel == 'Passenger'
                                                    ? 'Create Passenger'
                                                    : 'Create Driver',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white),
                                              ),
                                    onPressed: !state
                                            .status.isSubmissionInProgress
                                        ? () {
                                            dvaluel == 'Passenger'
                                                ? context
                                                    .read<LoginCubit>()
                                                    .registerPassengerWithCredentials(
                                                        name:
                                                            nameController.text,
                                                        email: emailController
                                                            .text,
                                                        number: phoneController
                                                            .text,
                                                        password:
                                                            passwordController
                                                                .text)
                                                : context
                                                    .read<LoginCubit>()
                                                    .registerDriverWithCredentials(
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text,
                                                      name: nameController.text,
                                                      number:
                                                          phoneController.text,
                                                      password_confirm:
                                                          passwordController
                                                              .text,
                                                      V_insurance: File(''),
                                                      V_registration: File(''),
                                                      d_license: File(''),
                                                      photo: File(''),
                                                      drugText: File(''),
                                                    );
                                            ;
                                          }
                                        : () {});
                              },
                            ),
                          ],
                        ))))),
      ),
    );
  }
}
