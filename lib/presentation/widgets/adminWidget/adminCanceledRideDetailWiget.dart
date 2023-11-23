import 'package:speedylimo/presentation/presentation.dart';
import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class AdminCanceledRideDetailWidget extends StatelessWidget {
  const AdminCanceledRideDetailWidget({
    Key? key,
    this.image,
    this.Bags = '',
    this.Drivername = '',
    this.DropOff = '',
    this.ExtraNote = '',
    this.PassengerName = '',
    this.Passengers = '',
    this.PaymentID = '',
    this.PaymentStatus = '',
    this.PickUp = '',
    this.Ridetype = '',
    this.Status = '',
    this.Status1 = '',
    this.Status2 = '',
    this.File,
    this.fontSize,
    this.email1,
    this.Time = '',
    this.email2,
  }) : super(key: key);

  final String PassengerName;
  final String Drivername;
  final String Ridetype;
  final String ExtraNote;
  final String PaymentID;
  final String PaymentStatus;
  final String Passengers;
  final String Bags;
  final String Time;
  final String Status;
  final String Status1;
  final String Status2;
  final String PickUp;
  final String DropOff;
  final Widget? File;
  final Widget? image;
  final double? fontSize;
  final VoidCallback? email1;
  final VoidCallback? email2;

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
                CustomLinearGradientWidget(
                  firstText: 'BASIC',
                  lastText: 'DETAILS',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Passenger Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      PassengerName,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Driver Name:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        Drivername,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Ride Type:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: tempColor.statusdark,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                        color: tempColor.statusdark,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 25,
                      width: 130,
                      child: Center(
                        child: Text(
                          Ridetype,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Extra Note:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      ExtraNote,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
                CustomLinearGradientWidget(
                  firstText: 'PAYMENT',
                  lastText: 'DETAILS',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment ID:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      PaymentID,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Status:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    CircleAvatar(
                      radius: 17.0,
                      backgroundColor: tempColor.statusdark,
                      child: Center(
                        child: Text(
                          PaymentStatus,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
                CustomLinearGradientWidget(
                  firstText: 'RIDE',
                  lastText: 'DETAILS',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Passengers:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      Passengers,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Bags:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Center(
                      child: Text(
                        Bags,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Time:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Text(
                      Time,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 15),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: tempColor.redColor,
                          style: BorderStyle.solid,
                          width: 1.5,
                        ),
                        color: tempColor.redColor,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      height: 25,
                      width: 90,
                      child: Center(
                        child: Text(
                          Status,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
                CustomLinearGradientWidget(
                  firstText: 'LOCATION',
                  lastText: 'INFO',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tempColor.statusdark,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    color: tempColor.statusdark,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 25,
                  width: 130,
                  child: Center(
                    child: Text(
                      Status1,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'PickUp:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        PickUp,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'DropOff:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 15),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          DropOff,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
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
                CustomLinearGradientWidget(
                  firstText: 'DROPOFF TIME /',
                  lastText: 'TRIP DURATION',
                  fontSize: 18,
                ),
                SizedBox(
                  height: 6,
                ),
                Container(
                  height: 0.5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: tempColor.statusdark,
                      style: BorderStyle.solid,
                      width: 1.5,
                    ),
                    color: tempColor.statusdark,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  height: 25,
                  width: 130,
                  child: Center(
                    child: Text(
                      Status2,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ]);
  }
}
