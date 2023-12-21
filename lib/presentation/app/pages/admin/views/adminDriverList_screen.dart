import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speedylimo/business_logic/cubits/cubits.dart';
import 'package:speedylimo/presentation/app/pages/pages.dart';

import '../../../../../services/services.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../../utils/utils.dart';
import '../../../../widgets/widget.dart';

class DriverListScreen extends StatefulWidget {
  const DriverListScreen({super.key});

  @override
  State<DriverListScreen> createState() => _DriverListScreenState();
}

class _DriverListScreenState extends State<DriverListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserManagementCubit>().getDriverList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserManagementCubit, UserManagementState>(
        builder: (context, state) {
          if (state is UserManagementInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserManagementLoaded) {
            final data = state.adminDriverData;
            return ListView.builder(
                itemCount: data.length, // The number of items in the list
                itemBuilder: (context, index) {
                  // Build and return each item based on its index
                  return UserManagementWidget(
                    Name: data[index].name ?? '',
                    Email: data[index].email ?? '',
                    Role: 'Driver',
                    Actions: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            NavigationService.instance
                                .navigateTo(editNewUserScreen);
                          },
                          child: CircleAvatar(
                            radius: 18.0,
                            backgroundColor: Colors.blue,
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        BlocConsumer<UserManagementCubit, UserManagementState>(
                          listener: (context, state) {
                            if (state is DeleteError) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: tempColor.redColor,
                                    content: Text(state.message),
                                  ),
                                );
                            }
                            if (state is DeleteLoaded) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: tempColor.blueColor,
                                    content: Text('User Deleted!!!'),
                                  ),
                                );
                            }
                          },
                          builder: (context, state) {
                            if (state is DeleteLoading) {
                              return Center(
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else {
                              return GestureDetector(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return DialogWiget(
                                          content: 'Do you want to Delete?',
                                          postiveButtonText: 'Yes',
                                          negetiveButtonText: 'No',
                                          contextt: context,
                                          onTap: () {
                                            context
                                                .read<UserManagementCubit>()
                                                .getUserDelete(
                                                    ID: data[index].id)
                                                .then((value) {
                                              NavigationService.instance
                                                  .goBack();
                                              context
                                                  .read<UserManagementCubit>()
                                                  .getDriverList();
                                            });
                                          },
                                        );
                                      });
                                },
                                child: CircleAvatar(
                                  radius: 18.0,
                                  backgroundColor: Colors.red,
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        data[index].driverDocs != null
                            ? GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DocumentScreen(data: data[index]);
                                    },
                                  ));
                                },
                                child: CircleAvatar(
                                  radius: 18.0,
                                  backgroundColor: Colors.green,
                                  child: Icon(
                                    Icons.attach_file,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                  );
                });
          } else {
            return Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.warning_amber_outlined,
                      color: Colors.amber,
                      size: 60,
                    ),
                    Text(
                      'No rides available for you',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: tempColor.blackColor),
                    )
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future showCanceldialoge() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWiget(
            content: 'Do you want to Delete?',
            postiveButtonText: 'Yes',
            negetiveButtonText: 'No',
            contextt: context,
            onTap: () {},
          );
        });
  }
}
