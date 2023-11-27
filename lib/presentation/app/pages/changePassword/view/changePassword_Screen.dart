import 'package:flutter/material.dart';

import '/utils/utils.dart';

import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../widgets/widget.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  bool _oldPass = true;
  bool _newPass = true;
  bool _confirmPass = true;
  @override
  void initState() {
    // oldPassController.text = 'aNgJ0';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    oldPassController.dispose();
    newPassController.dispose();
    confirmPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //  BlocProvider(
            //   create: (context) =>
            //       ChangePasswordCubit(context.read<AuthenticationRepository>()),
            //   child: BlocListener<ChangePasswordCubit, ChangePasswordstate>(
            //     listener: (context, state) {
            //       if (state.status.isSubmissionFailure) {
            //         ScaffoldMessenger.of(context)
            //           ..hideCurrentSnackBar()
            //           ..showSnackBar(SnackBar(
            //             content: Text(
            //               state.errorMessage ?? 'Password doesnot change',
            //             ),
            //           ));
            //       }
            //       if (state.status.isSubmissionSuccess) {
            //         ScaffoldMessenger.of(context)
            //           ..hideCurrentSnackBar()
            //           ..showSnackBar(SnackBar(
            //             content: Text(
            //               state.errorMessage ?? 'Password Changed',
            //             ),
            //           ));
            //         NavigationService.instance.pushAndRemoveUntil(HomeRoute);
            //       }
            //     },
            // child:
            Form(
                child: Stack(children: [
      //todo top background
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'lib/assets/icons/login.png',
              ),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken)),
        ),
      ),

      //todo email form

      Center(
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
                        padding: const EdgeInsets.only(top: 70),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                  child: Column(children: [
                                    const CustomLinearGradientWidget(
                                      firstText: 'Change',
                                      lastText: 'Password',
                                      fontSize: 30,
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    //todo oldPass field
                                    // BlocBuilder<ChangePasswordCubit, ChangePasswordstate>(
                                    //   buildWhen: (previous, current) =>
                                    //       previous.oldpassword != current.oldpassword,
                                    //   builder: (context, state) {
                                    //     return
                                    TextFieldWidget(
                                      controller: oldPassController,
                                      withLabel: true,
                                      hint: 'Old Password',
                                      labelText: 'Old Password',
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      obscureText: _oldPass,
                                      validatation: true,
                                      // validator: state.oldpassword.invalid
                                      //     ? 'Incorrect Password'
                                      //     : null,
                                      // onChanged: (oldpasword) => context
                                      //     .read<ChangePasswordCubit>()
                                      //     .oldpasswordChanged(oldpasword ?? ''),
                                      icon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _oldPass = !_oldPass;
                                          });
                                        },
                                        child: Icon(_oldPass
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      //     );
                                      //   },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //todo newPass field
                                    // BlocBuilder<ChangePasswordCubit, ChangePasswordstate>(
                                    //   buildWhen: (previous, current) =>
                                    //       previous.newpassword != current.newpassword,
                                    //   builder: (context, state) {
                                    //    return
                                    TextFieldWidget(
                                      controller: newPassController,
                                      withLabel: true,
                                      hint: 'New Password',
                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      labelText: 'New Password',
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      obscureText: _newPass,
                                      validatation: true,
                                      // validator: state.newpassword.invalid
                                      //     ? 'Incorrect Password'
                                      //     : null,
                                      // onChanged: (newpasword) => context
                                      //     .read<ChangePasswordCubit>()
                                      //     .newpasswordChanged(newpasword ?? ''),
                                      icon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _newPass = !_newPass;
                                          });
                                        },
                                        child: Icon(_newPass
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      //   );
                                      // },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //todo confirmPass field
                                    // BlocBuilder<ChangePasswordCubit, ChangePasswordstate>(
                                    //   buildWhen: (previous, current) =>
                                    //       previous.confirmpassword !=
                                    //       current.confirmpassword,
                                    //   builder: (context, state) {
                                    //     return
                                    TextFieldWidget(
                                      controller: confirmPassController,
                                      withLabel: true,
                                      hint: 'Confirm Password',

                                      hintStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      labelText: 'Confirm Password',
                                      labelStyle: const TextStyle(
                                        color: Colors.black,
                                      ),
                                      obscureText: _confirmPass,
                                      validatation: true,
                                      // validator: state.confirmpassword.invalid
                                      //     ? 'Incorrect Password'
                                      //     : null,
                                      // onChanged: (confirmpasword) => context
                                      //     .read<ChangePasswordCubit>()
                                      //     .confirmpasswordChanged(confirmpasword ?? ''),
                                      icon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _confirmPass = !_confirmPass;
                                          });
                                        },
                                        child: Icon(_confirmPass
                                            ? Icons.visibility_off
                                            : Icons.visibility),
                                      ),
                                      //   );
                                      // },
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    //todo login Button
                                    // BlocBuilder<ChangePasswordCubit, ChangePasswordstate>(
                                    //   buildWhen: (previous, current) =>
                                    //       previous.status != current.status,
                                    //   builder: (context, state) {
                                    //     return
                                    ButtonWidget(
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
                                      // childWidget: state.status.isSubmissionInProgress
                                      //     ? const
                                      //  child:  Center(
                                      //         child: SizedBox(
                                      //             height: 30,
                                      //             width: 30,
                                      //             child: CircularProgressIndicator()),
                                      //       )
                                      //     : Text(
                                      //         'Continue',
                                      //         style: TextStyle(
                                      //             color: tempColor.whiteColor,
                                      //             fontSize: 14,
                                      //             fontWeight: FontWeight.w600,
                                      //             fontFamily: 'Montserrat-Regular'),
                                      //       ),
                                      onPressed: () {
                                        // context
                                        //     .read<ChangePasswordCubit>()
                                        //     .ChangePassword(
                                        //         oldPassController.text,
                                        //         confirmPassController.text,
                                        //         newPassController.text);
                                      },
                                      cornerRadius: 5.0,
                                      childWidget: const Text(
                                        'SUBMITTED',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ])),
                            ]))
                  ])))
    ])));
    // );
  }
  //         ),
  //       ],
  //     ),
  //   ),
  // ),

  //     ),
  //   ),
  // ),
//       ),
//     );
//   }
}
