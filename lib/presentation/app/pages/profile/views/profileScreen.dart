import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
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
                  ? Container()
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
              child: Padding(
                  padding: EdgeInsets.all(14.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ProfileWidget(
                            color: Colors.grey,
                            imagePath: _image != null
                                ? CircleAvatar(
                                    radius: 40.0,
                                    backgroundColor: Colors.white,
                                    child: Image.file(
                                      _image!,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 60.0,
                                    backgroundColor: Colors.white,
                                    backgroundImage: AssetImage(
                                      'login'.png,
                                    ),
                                  ),
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.black,
                              size: 25.0,
                            ),
                            iconBackgroundColor: Colors.white,
                            onPressed: () {
                              _pickImage().then((value) =>
                                  print('image---------${_image!.path}'));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: nameController,
                              withLabel: true,
                              hint: 'Enter Your Name',
                              labelText: 'Enter Your Name',
                              keyboardType: TextInputType.name,
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: emailController,
                              withLabel: true,
                              hint: 'Enter Your Email',
                              labelText: 'Enter Your Email',
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: phoneController,
                              withLabel: true,
                              hint: 'Enter Your Phone',
                              labelText: 'Enter Your Phone',
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: accountController,
                              withLabel: true,
                              hint: 'Enter Your Account Number',
                              labelText: 'Enter Your Account  Number',
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: bankController,
                              withLabel: true,
                              hint: 'Enter Your Bank Name',
                              labelText: 'Enter Your Bank  Name',
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                              builder: (context, state) {
                            return TextFieldWidget(
                              enable: true,
                              controller: branchController,
                              withLabel: true,
                              hint: 'Enter Your Branch Name',
                              labelText: 'Enter Your Branch  Name',
                              validatation: false,
                              labelStyle: TextStyle(color: Colors.black),
                            );
                          }),
                          SizedBox(
                            height: 10,
                          ),
                          //todo update button
                          BlocBuilder<EditProfileCubit, EditProfileState>(
                            builder: (context, state) {
                              return ButtonWidget(
                                  key: const Key(
                                      'profileForm_continue_raisedButton'),
                                  isLoading: state.status.isSubmissionInProgress
                                      ? false
                                      : (!state.status.isSubmissionInProgress
                                          ? false
                                          : true),
                                  isOutline: state.status.isSubmissionInProgress
                                      ? true
                                      : false,
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
                                              'UPDATE',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onPrimary),
                                            ),
                                  onPressed: !state
                                          .status.isSubmissionInProgress
                                      ? () {
                                          var fileName =
                                              _image!.path.split('/').last;

                                          context
                                              .read<EditProfileCubit>()
                                              .updateUserProfileData(
                                            imageFile: _image!,
                                            data: {
                                              'name': nameController.text,
                                              'email': emailController.text,
                                              'phone_number':
                                                  phoneController.text,
                                              'account_number':
                                                  accountController.text,
                                              'bank_name': bankController.text,
                                              'branch_name': bankController.text
                                            },
                                          );
                                        }
                                      : () {});
                            },
                          )
                        ],
                      ))))),
    );
  }
}
