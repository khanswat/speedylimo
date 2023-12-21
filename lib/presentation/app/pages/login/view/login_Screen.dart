import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../../../../../business_logic/bussiness.logic.dart';
import '../../../../../data/data.dart';

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
  final SharedPrefs _sharedPrefs = SharedPrefs();
  bool showSuffix = false;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                data.user?.roles![0].name == 'Admin'
                    ? NavigationService.instance.pushAndReplac(adminHome)
                    : NavigationService.instance.pushAndReplac(bottomBarRoute);
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
              child: Center(
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'lib/assets/icons/Group 1530.png',
                        color: Colors.white,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
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
                          child: Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'LOG',
                                      style: TextStyle(
                                        color: tempColor.blackColor,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600,
                                      ),
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
                                //todo email field
                                BlocBuilder<LoginCubit, LoginState>(
                                  buildWhen: (previous, current) =>
                                      previous.email != current.email,
                                  key: const Key(
                                      'loginForm_numberInput_textField'),
                                  builder: (context, state) {
                                    return TextFieldWidget(
                                      controller: emailController,
                                      withLabel: true,
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
                                      validator: state.email.invalid
                                          ? 'Incorrect Email'
                                          : null,
                                      onChanged: (email) => context
                                          .read<LoginCubit>()
                                          .emailChanged(email ?? ''),
                                      icon:
                                          state.email.valid && state.email.pure
                                              ? null
                                              : Icon(
                                                  Icons.check_circle,
                                                  color: tempColor.greenColor,
                                                ),
                                    );
                                  },
                                ),

                                const SizedBox(
                                  height: 15,
                                ),
                                //todo password field
                                BlocBuilder<LoginCubit, LoginState>(
                                  buildWhen: (previous, current) =>
                                      previous.password != current.password,
                                  builder: (context, state) {
                                    return TextFieldWidget(
                                      controller: passwordController,
                                      withLabel: false,
                                      hint: 'Password',

                                      contentPadding: EdgeInsets.zero,
                                      labelText: 'Password',
                                      hintStyle:
                                          const TextStyle(color: Colors.black),
                                      obscureText: _obscureText,
                                      validatation: true,
                                      validator: state.password.invalid
                                          ? 'Incorrect Password'
                                          : null,

                                      prefixIcon: const Icon(
                                        Icons.lock,
                                        color: Colors.blueAccent,
                                      ),
                                      fillColor: const Color(0xffEFEFEF),
                                      labelStyle:
                                          const TextStyle(color: Colors.black),

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
                                    );
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
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
                                                    'Login',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  ),
                                        onPressed: () {
                                          context
                                              .read<LoginCubit>()
                                              .logInWithCredentials(
                                                  emailController.text,
                                                  passwordController.text);
                                        });
                                  },
                                ),

                                //todo forgot password Button
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    // TextButton(
                                    //     onPressed: () => NavigationService
                                    //         .instance
                                    //         .navigateTo(signupRout),
                                    //     child: Text(
                                    //       'Sign Up',
                                    //       style: TextStyle(
                                    //           color: tempColor.blackColor,
                                    //           fontSize: 14,
                                    //           fontWeight: FontWeight.w400,
                                    //           fontFamily: 'Montserrat-Regular'),
                                    //     )),
                                    TextButton(
                                        onPressed: () => NavigationService
                                            .instance
                                            .navigateTo(forgotPasswordRoute),
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: tempColor.blueColor,
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                    onTap: () {
                                      NavigationService.instance
                                          .navigateTo(signupRout);
                                    },
                                    child: RichText(
                                      text: TextSpan(
                                        text: 'New to SpeedyLimo? ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontStyle: FontStyle.normal,
                                            fontSize: 14),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Register Now',
                                            style: TextStyle(
                                                color: tempColor.blueColor,
                                                fontWeight: FontWeight.w800,
                                                fontStyle: FontStyle.italic,
                                                fontSize: 16),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          //     ),
          //   );
        ));
  }
}
