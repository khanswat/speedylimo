import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../data/data.dart';
import '/services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../widgets/widget.dart';
import '/utils/utils.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  bool showSuffix = false;
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
        body:
            // BlocProvider(
            //   create: (context) =>
            //       ForgotPasswordCubit(context.read<AuthenticationRepository>()),
            //   child: BlocListener<ForgotPasswordCubit, ForgotPasswordstate>(
            //     listener: (context, state) {
            //       if (state.status.isSubmissionFailure) {
            //         ScaffoldMessenger.of(context)
            //           ..hideCurrentSnackBar()
            //           ..showSnackBar(SnackBar(
            //             content: Text(
            //               state.errorMessage ?? 'Invalid Email',
            //             ),
            //           ));
            //       }
            // if (state.status.isSubmissionSuccess) {
            // ScaffoldMessenger.of(context)
            //   ..hideCurrentSnackBar()
            //   ..showSnackBar(SnackBar(
            //     content: Text(
            //       state.errorMessage ??
            //           'Your new password has sent to your email, Please check your email.',
            //     ),
            //   ));
            //     NavigationService.instance.navigateTo(LoginRoute);
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot',
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
                                    colors: [Colors.blue, Color(0xff00C6FF)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ).createShader(bounds);
                                },
                                child: RichText(
                                  text: const TextSpan(
                                    text: 'Password',
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

                    SizedBox(
                      height: 20,
                    ),
                    //todo email field
                    // BlocBuilder<ForgotPasswordCubit, ForgotPasswordstate>(
                    //   buildWhen: (previous, current) =>
                    //       previous.email != current.email,
                    //   key: const Key('loginForm_numberInput_textField'),
                    //   builder: (context, state) {
                    //     return
                    TextFieldWidget(
                      controller: emailController,
                      withLabel: true,
                      validatation: true,
                      hint: 'Email Address',
                      labelText: "Email Address",
                      // validator:
                      //     state.email.invalid ? 'Incorrect Email' : null,
                      // onChanged: (email) => context
                      //     .read<ForgotPasswordCubit>()
                      //     .emailChanged(email ?? ''),
                      icon: showSuffix
                          ? Icon(
                              Icons.check_circle,
                              color: tempColor.greenColor,
                            )
                          : null,
                    ),
                    //   },
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    //todo login Button
                    // BlocBuilder<ForgotPasswordCubit, ForgotPasswordstate>(
                    //   builder: (context, state) {
                    //     return
                    ButtonWidget(
                        key: const Key('loginForm_continue_raisedButton'),
                        childWidget:
                            // isLoading: state.status.isSubmissionInProgress
                            //     ? false
                            //     : (state.status.isValidated &&
                            //             !state.status.isSubmissionInProgress
                            //         ? false
                            //         : true),
                            // isOutline: state.status.isSubmissionInProgress
                            //     ? true
                            //     : false,
                            // childWidget: state.status.isSubmissionInProgress
                            //     ? const Center(
                            //         child: SizedBox(
                            //             height: 30,
                            //             width: 30,
                            //             child: CircularProgressIndicator()),
                            //       )
                            //     :
                            Text(
                          'Send Password Reset Link',
                          style: TextStyle(
                              color: tempColor.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Montserrat-Regular'),
                        ),
                        onPressed
                            //!state.status.isSubmissionInProgress &&
                            //         state.status.isValidated
                            //     ? () {
                            //         context
                            //             .read<ForgotPasswordCubit>()
                            //             .ForgotEmail(
                            //               emailController.text,
                            //             );
                            //       }
                            : () {}),
                    // cornerRadius: 5.0,
                  ],
                )),
          ),
        ),
      ],
    ));
  }
}
