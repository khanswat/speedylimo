// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class BookingQueriesDetailWidget extends StatelessWidget {
  const BookingQueriesDetailWidget({
    Key? key,
    this.image,
    this.name = '',
    this.EmailAddress = '',
    this.PhoneNo = '',
    this.ContactMethod = '',
    this.CompanyName = '',
    this.ContactEmail = '',
    this.RequestDetail = '',
    this.Summary = '',
    this.File,
    this.fontSize,
    this.email1,
    this.datetime = '',
    this.email2,
  }) : super(key: key);

  final String name;
  final String EmailAddress;
  final String ContactEmail;
  final String PhoneNo;
  final String ContactMethod;
  final String CompanyName;
  final String Summary;
  final String datetime;
  final String RequestDetail;
  final Widget? File;
  final Widget? image;
  final double? fontSize;
  final VoidCallback? email1;
  final VoidCallback? email2;
  void launchwatsapp({@required number, @required Message}) async {
    var url = 'whatsapp://send?phone-$number@text-$Message';
    await canLaunch(url) ? launch(url) : print('cant open');
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: tempColor.lightGreyColor,
              style: BorderStyle.solid,
              width: 1.5,
            ),
            color: tempColor.whiteColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      name,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Email Address:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () => launchGmail(),
                      child: Text(
                        EmailAddress,
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact Email:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () => launch('Gmail:$ContactEmail'),
                      child: Text(
                        ContactEmail,
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Phone No:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      PhoneNo,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Contact Method:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      ContactMethod,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Company Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      CompanyName,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Summary:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      Summary,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Request Detail:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      RequestDetail,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'File:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Container(child: File),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Date / Time:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      datetime,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ))
    ]);
  }
}

void launchGmail() async {
  var subject = 'Subject:';
  var stringText = 'Same Message:';
  var email = 'administrator@gmail.com';
  final uri =
      'mailto:$email?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(stringText)}';

  if (await canLaunch(uri)) {
    await launch(uri);
  } else {
    print('No email client found');
  }
}
