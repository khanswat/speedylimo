import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedylimo/services/navigation/navigation_service.dart';
import 'package:speedylimo/utils/constants/routes/routes_name.dart';
import 'package:url_launcher/url_launcher.dart';
import '/business_logic/cubits/cubits.dart';
import '/extensions/extension.dart';
import '/utils/constants/app/app_constants.dart';
import '/presentation/presentation.dart';

class AllRidesScreen extends StatefulWidget {
  AllRidesScreen({super.key});

  @override
  State<AllRidesScreen> createState() => _AllRidesScreenState();
}

class _AllRidesScreenState extends State<AllRidesScreen> {
  File? _image;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController accountController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  @override
  void initState() {
    final data = context.read<UserCubit>().state.userData?.user;
    nameController.text = data?.name ?? '';
    emailController.text = data?.email ?? '';
    phoneController.text = data?.phoneNumber ?? '';
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _pickImage() async {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }

    return BlocListener<EditProfileCubit, EditProfileState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                  backgroundColor: tempColor.blueColor,
                  content: Text(state.errorMessage ?? '')),
            );
        }

        if (state.status.isSubmissionSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                backgroundColor: tempColor.blueColor,
                content: Text(state.errorMessage!),
              ),
            );
        }
      },
      child: Scaffold(
          endDrawer:
              context.read<UserCubit>().state.userData?.user?.roles![0].name !=
                      'Passenger'
                  ? null
                  : NavDrawer(context),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBarWidget(
                isshow: context
                            .read<UserCubit>()
                            .state
                            .userData
                            ?.user
                            ?.roles![0]
                            .name !=
                        'Passenger'
                    ? false
                    : false,
                showback: true,
                logo: true,
                title1: '',
                title2: '',
                name: '',
              )),
          body: SingleChildScrollView(
              child: Container(
                  margin: EdgeInsets.all(12.0),
                  padding: EdgeInsets.all(12),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'My Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () =>
                            NavigationService.instance.navigateTo(myride),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Accepted Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => NavigationService.instance
                            .navigateTo(acceptedRides),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Cancelled Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () =>
                            NavigationService.instance.navigateTo(cancellRides),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'rides'.png,
                          height: 30,
                          color: Colors.grey,
                        ),
                        title: Text(
                          'Completed Rides',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => NavigationService.instance
                            .navigateTo(completeRides),
                      ),
                    ],
                  )))),
    );
  }

  Future showCanceldialoge() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return DialogWiget(
            content: 'Do you want to logout?',
            postiveButtonText: 'Yes',
            negetiveButtonText: 'No',
            contextt: context,
            onTap: () {
              // context.read<LogoutCubit>().getlogout();
              context.read<UserCubit>().logout();

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Successfully Logout'),
                  ),
                );
              NavigationService.instance.pushAndRemoveUntil(loginRoute);
            },
          );
        });
  }
}
