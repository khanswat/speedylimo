import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:speedylimo/business_logic/cubits/cubits.dart';

import '../../../../widgets/Widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speedylimo/presentation/presentation.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import '../../../../widgets/widget.dart';

class GetSupportScreen extends StatefulWidget {
  const GetSupportScreen({Key? key}) : super(key: key);

  @override
  State<GetSupportScreen> createState() => _GetSupportScreenState();
}

class _GetSupportScreenState extends State<GetSupportScreen> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController summaryController = TextEditingController();
  TextEditingController companynameController = TextEditingController();
  TextEditingController issueController = TextEditingController();
  String? file;
  bool showSuffix = false;
  bool status = false;
  int _selectedValue = 1;
  int selectedRadio = 1;
  var dvaluel = 'Booking';

  Future<String?> pickFile() async {
    try {
      var result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpeg', 'jpg', 'png', 'pdf'],
      );

      if (result != null) {
        print(result.files.single.path);
        return result.files.single.path;
      }
    } catch (e) {
      print('Error picking file: $e');
    }

    return null;
  }

  @override
  void initState() {
    super.initState();
    selectedRadio = 1;
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SupportCubit(),
      child: BlocListener<SupportCubit, SupportState>(
        listener: (context, state) {
          if (state.status.isSubmissionFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                backgroundColor: tempColor.blueColor,
                content: Text(
                  state.errorMessage ?? 'Error',
                ),
              ));
          }
          if (state.status.isSubmissionSuccess) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(
                  'Successfully Submitted!!!',
                ),
              ));
          }
        },
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(80),
              child: AppBarWidget(
                isshow: false,
                showback: true,
                logo: false,
                title1: 'Get',
                title2: 'Support',
                name: '',
              )),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Column(children: [
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: const CustomLinearGradientWidget(
                            firstText: 'Book a',
                            lastText: 'Limo Now',
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          'Need a quote? You are our number one priority. Get in touch now to book the right limo and make your occasion',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: selectedRadio,
                                activeColor: Colors.green,
                                onChanged: (val) {
                                  print('Radio $val');
                                  setSelectedRadio(val ?? 0);
                                },
                              ),
                              Text('Booking')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: selectedRadio,
                                activeColor: Colors.blue,
                                onChanged: (val) {
                                  print('Radio $val');
                                  setSelectedRadio(val ?? 0);
                                },
                              ),
                              Text('Driver')
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: emailController,
                            withLabel: true,
                            hint: 'Enter Email Address',
                            labelText: 'Enter Email Address',
                            fillColor: Color(0xffEFEFEF),
                            validatation: false,
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: firstnameController,
                            withLabel: true,
                            hint: 'Enter First Name',
                            labelText: ' Enter First Name',
                            fillColor: Color(0xffEFEFEF),
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: lastnameController,
                            withLabel: true,
                            hint: 'Enter Last Name',
                            labelText: ' Enter Last Name',
                            fillColor: Color(0xffEFEFEF),
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: phoneNumberController,
                            withLabel: true,
                            hint: 'Enter Phone Number',
                            labelText: ' Enter Phone Number',
                            fillColor: Color(0xffEFEFEF),
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const CustomLinearGradientWidget(
                        lastText: 'Preferred Contact Method',
                        fontSize: 18,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: _selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                },
                              ),
                              const Text('Email'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 2,
                                groupValue: _selectedValue,
                                onChanged: (value) {
                                  setState(() {
                                    _selectedValue = value!;
                                  });
                                  print(_selectedValue);
                                },
                              ),
                              const Text('Phone'),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: companynameController,
                            withLabel: true,
                            hint: 'Enter Company name',
                            labelText: ' Enter Company Name',
                            fillColor: Color(0xffEFEFEF),
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return TextFieldWidget(
                            controller: summaryController,
                            withLabel: true,
                            hint: 'Enter Summary',
                            labelText: ' Enter Summary',
                            fillColor: Color(0xffEFEFEF),
                            labelStyle: TextStyle(color: Colors.black),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      BlocBuilder<SupportCubit, SupportState>(
                        builder: (context, state) {
                          return Container(
                            height: MediaQuery.of(context).size.height / 4,
                            child: TextFormField(
                              controller: issueController,
                              maxLines: null, // Set this
                              expands: true, // and this
                              keyboardType: TextInputType.multiline,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                filled: true,
                                fillColor: Color(0xffEFEFEF),
                                labelStyle: TextStyle(color: Colors.black),

                                isCollapsed: false,
                                // filled: true,
                                isDense: false,

                                hintText: 'Details of Request or Issue',

                                labelText: 'Details of Request or Issue',
                                hintStyle: TextStyle(color: Colors.black),
                                //border: InputBorder.none,
                                // errorStyle: const TextStyle(height: 0),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: tempColor.blueColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: tempColor.lightGreyColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: tempColor.lightGreyColor),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Theme.of(context).colorScheme.error,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                  Container(
                    margin: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            file = await pickFile();
                          },
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.file_upload_outlined,
                                    color: Colors.blue,
                                    size: 50,
                                  ),
                                  const Text(
                                    'Drop file here',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Accepted file types: jpg, jpeg, gif, png, pdf, webp, webm, heif, hevc, Max. file size: 5 MB, Max. files: 5.\n To expedite your request, please include a screen shot of the issue you had (if possible).',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocBuilder<SupportCubit, SupportState>(
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return ButtonWidget(
                                cornerRadius: 5.0,
                                key: const Key(
                                    'loginForm_continue_raisedButton'),
                                isLoading: state.status.isSubmissionInProgress
                                    ? false
                                    : (!state.status.isSubmissionInProgress
                                        ? false
                                        : true),
                                isOutline: state.status.isSubmissionInProgress
                                    ? true
                                    : false,
                                height: 50,
                                childWidget: state.status.isSubmissionInProgress
                                    ? const Center(
                                        child: SizedBox(
                                            height: 30,
                                            width: 30,
                                            child: CircularProgressIndicator()),
                                      )
                                    : Text(
                                        'Submit',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.white),
                                      ),
                                onPressed: () {
                                  context.read<SupportCubit>().PostSupport(
                                      email: emailController.text,
                                      contact_method: '1',
                                      first_name: firstnameController.text,
                                      last_name: lastnameController.text,
                                      company_name: companynameController.text,
                                      technology: '1',
                                      summary: summaryController.text,
                                      request_detail: issueController.text,
                                      file: File(file ?? ''),
                                      number: phoneNumberController.text);
                                });
                          },
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
