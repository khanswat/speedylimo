// ignore_for_file: unnecessary_new

import 'dart:ui';

import '../../../business_logic/cubits/logoutCubit/logout_cubit.dart';
import '../../../business_logic/cubits/logoutCubit/logout_state.dart';
import '../../../business_logic/cubits/userCubit/user_cubit.dart';
import '../../../utils/constants/app/app_constants.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '/services/services.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../presentation.dart';

class DialogWiget extends StatefulWidget {
  final String content;

  BuildContext contextt;

  DialogWiget({
    Key? key,
    required this.content,
    required this.contextt,
  }) : super(key: key);

  @override
  State<DialogWiget> createState() => _DialogWigetState();
}

class _DialogWigetState extends State<DialogWiget> {
  @override
  void initState() {
    super.initState();
    context.read<LogoutCubit>().getlogout();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogoutCubit, LogoutState>(
      listener: (context, state) {
        if (state is LogoutError) {
          NavigationService.instance.goBack();
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
        }
      },
      builder: (context, state) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
          child: AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            contentPadding: const EdgeInsets.all(12.0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    widget.content,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: tempColor.blackColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 40,
                        width: 80,
                        child: ButtonWidget(
                          isOutline: true,
                          childWidget: Text(
                            'No',
                            style: TextStyle(
                                color: tempColor.blueColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () => NavigationService.instance.goBack(),
                        ),
                      ),
                      SizedBox(
                          height: 40,
                          width: 80,
                          child: BlocBuilder<LogoutCubit, LogoutState>(
                            builder: (context, state) {
                              return ButtonWidget(
                                  childWidget: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    context.read<LogoutCubit>().getlogout();
                                    context.read<UserCubit>().logout();
                                    ScaffoldMessenger.of(context)
                                      ..hideCurrentSnackBar()
                                      ..showSnackBar(
                                        const SnackBar(
                                          content: Text('Successfully Logout'),
                                        ),
                                      );
                                    NavigationService.instance
                                        .pushAndRemoveUntil(loginRoute);
                                  });
                              //}
                            },
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  // showdialoge(context) {
  //   return showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return ProgressDialogWiget();
  //       });
  // }
}
