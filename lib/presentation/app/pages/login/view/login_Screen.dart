import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

import 'package:speedylimo/presentation/widgets/DropDowanWidget/dropdown_Widget.dart';

import '../../../../../data/data.dart';
import '/business_logic/cubits/cubits.dart';

import '/presentation/presentation.dart';
import '/services/navigation/navigation_service.dart';

import '/utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  SharedPrefs _sharedPrefs = SharedPrefs();
  bool showSuffix = false;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    // emailController.text = 'khanjee11395@gmail.com';
    // passwordController.text = 'DA0zA';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // BlocProvider(
          //   create: (_) => LoginCubit(context.read<AuthenticationRepository>()),
          //   child: BlocListener<LoginCubit, LoginState>(
          //     listener: (context, state) {
          //       if (state.status.isSubmissionFailure) {
          //         ScaffoldMessenger.of(context)
          //           ..hideCurrentSnackBar()
          //           ..showSnackBar(SnackBar(
          //             content: Text(
          //               state.errorMessage ?? 'Login Error',
          //             ),
          //           ));
          //       }
          //       if (state.status.isSubmissionSuccess) {
          //         final cubit = context.read<LoginCubit>();
          //         NavigationService.instance.pushAndRemoveUntil(HomeRoute);

          //         _sharedPrefs
          //             .setToken(cubit.state.userModel?.data?.accessToken ?? '');
          //         NavigationService.instance.navigatorKey.currentContext!
          //             .read<UserCubit>()
          //             .updateName(context
          //                 .read<LoginCubit>()
          //                 .state
          //                 .userModel
          //                 ?.data
          //                 ?.userData
          //                 ?.userDisplayName);

          //         NavigationService.instance.navigatorKey.currentContext!
          //             .read<UserCubit>()
          //             .updateEmail(context
          //                 .read<LoginCubit>()
          //                 .state
          //                 .userModel
          //                 ?.data
          //                 ?.userData
          //                 ?.userName);
          //         // NavigationService.instance.navigatorKey.currentContext!
          //     .read<UserCubit>()
          //     .updateToken(context
          //         .read<LoginCubit>()
          //         .state
          //         .userModel
          //         ?.data
          //         ?.accessToken);
          //  UserSecureStorage().setField('accessToken',
          //     cubit.state.userModel?.data?.accessToken ?? '');
          //   }
          // },
          Stack(
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
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "lib/assets/icons/Group 1530.png",
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 70),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //todo login form
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
                          // Container(
                          //   width: MediaQuery.of(context).size.width,
                          //   height: MediaQuery.of(context).size.height / 1 * 1.5,
                          //   decoration: const BoxDecoration(
                          //     image: DecorationImage(
                          //         image: AssetImage(
                          //           "lib/assets/icons/login.png",
                          //         ),
                          //         fit: BoxFit.fill,
                          //         colorFilter: ColorFilter.mode(
                          //             Colors.black54, BlendMode.darken)),
                          //   ),
                          // ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //Center(
                                //   child: Column(
                                //     children: [
                                //       SizedBox(height: 20),
                                //       Row(
                                //         mainAxisAlignment: MainAxisAlignment.center,
                                //         children: [
                                //           Text(
                                //             'Register ',
                                //             style: TextStyle(
                                //               fontSize: 18,
                                //               letterSpacing: 2.0,
                                //               fontWeight: FontWeight.w600,
                                //               color: tempColor.whiteColor,
                                //             ),
                                //           ),
                                //           Text(
                                //             'your account',
                                //             style: TextStyle(
                                //               fontSize: 18,
                                //               letterSpacing: 2.0,
                                //               fontWeight: FontWeight.w600,
                                //               color: Theme.of(context).colorScheme.primary,
                                //             ),
                                //           ),
                                //         ],
                                //       ),
                                //       SizedBox(
                                //         height: 10,
                                //       ),
                                //       Text(
                                //         'Welcome to our Speedy Limo! We are delighted to have you here. Please log in to access your account and start exploring our services. If you don t have an account yet, you can easily create one by clicking on the sign-up button. Thank you for choosing us!',
                                //         style: TextStyle(
                                //           fontSize: 11,
                                //           letterSpacing: 2.0,
                                //           fontWeight: FontWeight.w600,
                                //           color: tempColor.whiteColor,
                                //         ),
                                //         textAlign: TextAlign.justify,
                                //       ),
                                //     ],
                                //   ),
                                // ),

                                // Text(
                                //   'Login your account',
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       fontWeight: FontWeight.w700,
                                //       color: tempColor.whiteColor,
                                //       fontFamily: 'AbrilFatface-Regular'),
                                // ),

                                //todo email field
                                // BlocBuilder<LoginCubit, LoginState>(
                                //   buildWhen: (previous, current) =>
                                //       previous.email != current.email,
                                //   key: const Key('loginForm_numberInput_textField'),
                                //   builder: (context, state) {
                                //     return

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOG',
                                      style: TextStyle(
                                          color: tempColor.blackColor,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w600,
                                          fontFamily:
                                              'lib/assets/font/AbrilFatface-Regular.ttf'),
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
                                                text: 'IN',
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

                                TextFieldWidget(
                                    controller: emailController,
                                    withLabel: false,
                                    hint: 'Email Address',
                                    labelText: 'Email Address',
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.blueAccent,
                                    ),
                                    fillColor: const Color(0xffEFEFEF),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintStyle: const TextStyle(
                                        color: Colors.black, fontSize: 16),
                                    validatation: true,
                                    // validator: state.email.invalid
                                    //     ? 'Incorrect Email'
                                    //     : null,
                                    onChanged: (email) => context
                                    //     .read<LoginCubit>()
                                    //     .emailChanged(email ?? ''),
                                    // icon: state.email.valid && state.email.pure
                                    //     ? null
                                    //     : Icon(
                                    //         Icons.check_circle,
                                    //         color: tempColor.greenColor,
                                    // ),
                                    //   );
                                    // },

                                    ),
                                const SizedBox(
                                  height: 15,
                                ),
                                //todo password field
                                // BlocBuilder<LoginCubit, LoginState>(
                                //   buildWhen: (previous, current) =>
                                //       previous.password != current.password,
                                //   builder: (context, state) {
                                //     return
                                TextFieldWidget(
                                  controller: passwordController,
                                  withLabel: false,
                                  hint: 'Password',
                                  labelText: 'Password',
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  obscureText: _obscureText,
                                  validatation: false,
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Colors.blueAccent,
                                  ),
                                  fillColor: const Color(0xffEFEFEF),
                                  labelStyle:
                                      const TextStyle(color: Colors.black),
                                  // validator: state.password.invalid
                                  //     ? 'Incorrect Password'
                                  //     : null,
                                  // onChanged: (pasword) => context
                                  //     .read<LoginCubit>()
                                  //     .passwordChanged(pasword ?? ''),
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
                                  //   );
                                  // },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),

                                //todo login Button
                                // BlocBuilder<LoginCubit, LoginState>(
                                //   buildWhen: (previous, current) =>
                                //       previous.status != current.status,
                                //   builder: (context, state) {
                                //     return
                                ButtonWidget(
                                    cornerRadius: 5.0,
                                    key: const Key(
                                        'loginForm_continue_raisedButton'),
                                    // isLoading: state.status.isSubmissionInProgress
                                    //     ? false
                                    //     : (state.status.isValidated &&
                                    //             !state.status.isSubmissionInProgress
                                    //         ? false
                                    //         : true),
                                    // isOutline: state.status.isSubmissionInProgress
                                    //     ? true
                                    //     : false,
                                    childWidget:
                                        // state.status.isSubmissionInProgress
                                        //     ? const Center(
                                        //         child: SizedBox(
                                        //             height: 30,
                                        //             width: 30,
                                        //             child: CircularProgressIndicator()),
                                        //       )
                                        Text(
                                      'Login',
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    onPressed:
                                        // !state.status.isSubmissionInProgress &&
                                        //         state.status.isValidated
                                        //     ? () {
                                        //         context
                                        //             .read<LoginCubit>()
                                        //             .logInWithCredentials(
                                        //                 emailController.text,
                                        //                 passwordController.text);
                                        //       }
                                        //     :
                                        () {
                                      NavigationService.instance
                                          .navigateTo(homeRoute1);
                                    }),
                                //   },
                                // ),
                                const SizedBox(
                                  height: 10,
                                ),
                                //todo forgot password Button
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    TextButton(
                                        onPressed: () => NavigationService
                                            .instance
                                            .navigateTo(signupRout),
                                        child: Text(
                                          'Signup',
                                          style: TextStyle(
                                              color: tempColor.blackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat-Regular'),
                                        )),
                                    TextButton(
                                        onPressed: () => NavigationService
                                            .instance
                                            .navigateTo(forgotPasswordRoute),
                                        child: Text(
                                          'Forgot Password',
                                          style: TextStyle(
                                              color: tempColor.blackColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Montserrat-Regular'),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
    //     ),
    //   );
  }
}
