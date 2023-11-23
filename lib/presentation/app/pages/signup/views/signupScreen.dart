import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../business_logic/bussiness.logic.dart';
import '../../../../../data/data.dart';
import '../../../../../services/services.dart';
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

  Future<void> pickImage(ImageSource gallery) async {
    try {
      final t = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (t == null) return;
      final imageTemporary = File(t.path);
      imageUni8 = imageTemporary.readAsBytesSync();
      var paths = imageTemporary.path;
      print('pphhhh' + paths);
      // Navigator.of(context).pop();
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  final SharedPrefs _sharedPrefs = SharedPrefs();
  bool showSuffix = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
    passwordController.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
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
                final data = context.read<LoginCubit>().state.userModel?.data!;
                context.read<UserCubit>().updateUser(data!);
                _sharedPrefs.setToken(data.token ?? '');
                NavigationService.instance.pushAndReplac(bottomBarRoute);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage(
                      'login'.png,
                    ),
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.black45, BlendMode.darken)),
              ),
              child: Form(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
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
                              BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return TextFieldWidget(
                                    controller: nameController,
                                    withLabel: true,
                                    hint: 'Name',
                                    labelText: 'Name',
                                    fillColor: Color(0xffEFEFEF),
                                    validatation: true,
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
                                    validatation: true,
                                    validator: state.number.invalid
                                        ? 'Incorrect Number'
                                        : null,
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
                                                title: 'CNIC Front Side',
                                                icons:
                                                    'lib/assets/icons/idp.png',
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
                                                title: 'CNIC Back Side',
                                                icons:
                                                    'lib/assets/icons/idp.png',
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
                                                    'Driving License  Front Side',
                                                icons:
                                                    'lib/assets/icons/idp.png',
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
                                                title: 'Partner Photo',
                                                icons:
                                                    'lib/assets/icons/idp.png',
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
                                                    'Vehicle Registration Book',
                                                icons:
                                                    'lib/assets/icons/idp.png',
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
                                          : (state.status.isValidated &&
                                                  !state.status
                                                      .isSubmissionInProgress
                                              ? false
                                              : true),
                                      isOutline:
                                          state.status.isSubmissionInProgress
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
                                                  'REGISTER',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white),
                                                ),
                                      onPressed: () {
                                        context
                                            .read<LoginCubit>()
                                            .registerPassengerWithCredentials(
                                                name: nameController.text,
                                                email: emailController.text,
                                                number: phoneController.text,
                                                password:
                                                    passwordController.text);
                                      });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
