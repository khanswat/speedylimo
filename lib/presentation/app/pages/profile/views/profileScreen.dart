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

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
    print(context.read<UserCubit>().state.userData?.user?.image);
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
                    : true,
                showback: false,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ProfileWidget(
                        color: Colors.blue,
                        imagePath: CircleAvatar(
                          radius: 65.0,
                          backgroundColor: Colors.white,
                          backgroundImage: NetworkImage(
                              'https://myspeedylimo.com/images/profile/${context.read<UserCubit>().state.userData?.user?.image}'),
                        ),

                        // icon: Icon(
                        //   Icons.camera_alt,
                        //   color: Colors.black,
                        //   size: 25.0,
                        // ),
                        // iconBackgroundColor: Colors.white,
                        onPressed: () {
                          // _pickImage().then((value) =>
                          //     print('image---------${_image!.path}'));
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        nameController.text,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        emailController.text,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.person_outline_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Edit Profile',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () =>
                            NavigationService.instance.navigateTo(editProfile),
                      ),
                      context
                                  .read<UserCubit>()
                                  .state
                                  .userData
                                  ?.user
                                  ?.roles![0]
                                  .name ==
                              'Passenger'
                          ? ListTile(
                              leading: Icon(
                                Icons.directions_car_filled_outlined,
                                size: 25,
                                color: Colors.grey,
                              ),
                              title: const Text(
                                'My Rides',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                              onTap: () => NavigationService.instance
                                  .navigateTo(allRides),
                            )
                          : Container(),
                      ListTile(
                        leading: Icon(
                          Icons.location_on_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          '2624 Wilkinson Blvd. Charlotte, NC 28208',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => launch(
                            'https://www.google.com/maps/search/?api=1&query='
                            '2624 Wilkinson Blvd. Charlotte, NC 28208'),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.call_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          '+17043766668',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => launch('tel:+17043766668'),
                      ),
                      ListTile(
                          leading: Icon(
                            Icons.email_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
                          title: const Text(
                            'info@myspeedylimo.co',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onTap: () {}),
                      ListTile(
                          leading: Icon(
                            Icons.privacy_tip_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
                          title: const Text(
                            'Privacy Policy | Terms & Conditions',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onTap: () => NavigationService.instance
                              .navigateTo(policyTerms)),
                      ListTile(
                          leading: Icon(Icons.contact_support_outlined,
                              size: 25, color: Colors.grey),
                          title: const Text(
                            'Get Support',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onTap: () => NavigationService.instance
                              .navigateTo(getSupport)),
                      ListTile(
                          leading: Icon(
                            Icons.announcement_outlined,
                            size: 25,
                            color: Colors.grey,
                          ),
                          title: const Text(
                            'About US',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                          onTap: () =>
                              NavigationService.instance.navigateTo(aboutUs)),
                      ListTile(
                        leading: Icon(
                          Icons.password_sharp,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Change Password',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () => NavigationService.instance
                            .navigateTo(changePasswordRoute),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.logout_outlined,
                          size: 25,
                          color: Colors.grey,
                        ),
                        title: const Text(
                          'Logout',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onTap: () {
                          showCanceldialoge();
                        },
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
