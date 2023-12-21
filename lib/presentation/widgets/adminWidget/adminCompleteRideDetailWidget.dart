import 'package:speedylimo/presentation/presentation.dart';
import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class AdminCompletedRideDetailWidget extends StatelessWidget {
  const AdminCompletedRideDetailWidget({
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
          margin: const EdgeInsets.all(10.0),
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Passenger Name:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        PassengerName,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Driver Name:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        Drivername,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Ride Type:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
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
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                Ridetype,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ],
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
                      flex: 2,
                      child: Text(
                        'Extra Note:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ExtraNote,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      Container(
          margin: const EdgeInsets.all(10.0),
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Payment ID:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        PaymentID,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Payment Status:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        PaymentStatus,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
      Container(
          margin: const EdgeInsets.all(10.0),
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
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Passengers:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        Passengers,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
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
                      flex: 2,
                      child: Text(
                        'Bags:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        Bags,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
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
                      flex: 2,
                      child: Text(
                        'Time:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        Time,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
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
                      flex: 2,
                      child: Text(
                        'Status:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.yellow,
                                style: BorderStyle.solid,
                                width: 1.5,
                              ),
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                Status,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13),
                              ),
                            ),
                          ),
                        ],
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                          fontSize: 13),
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
                      flex: 2,
                      child: Text(
                        'PickUp:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 13),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        PickUp,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
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
                      flex: 2,
                      child: Text(
                        'DropOff:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                            fontSize: 12),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          DropOff,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
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
                          fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          )),
    ]);
  }
}
