import 'package:speedylimo/presentation/presentation.dart';
import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class BookingDetailWidget extends StatelessWidget {
  const BookingDetailWidget({
    Key? key,
    this.passengerName = '',
    this.bookingType = '',
    this.rideStatus,
    this.noPassenger = '',
    this.noBages = '',
    this.pickupTime = '',
    this.droffTime = '',
    this.pickupLocation = '',
    this.drpOffLocstion = '',
    this.specialInstructions = '',
    this.tripType = '',
    this.estDriveTime = '',
    this.estDistance = '',
    this.totslAmount = '',
    this.fillColor,
    this.controller,
  }) : super(key: key);

  final TextEditingController? controller;

  final Widget? rideStatus;
  final Color? fillColor;
  final String passengerName;
  final String bookingType;
  final String noPassenger;
  final String noBages;
  final String pickupTime;
  final String droffTime;
  final String pickupLocation;
  final String drpOffLocstion;
  final String specialInstructions;
  final String tripType;
  final String estDriveTime;
  final String estDistance;
  final String totslAmount;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //todo booking Detail
          Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                CustomLinearGradientWidget(
                  firstText: 'Booking',
                  lastText: 'Detail',
                  fontSize: 24,
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Passenger Name :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      passengerName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Booking Type :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      bookingType,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Ride Status :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: rideStatus,
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'No of Passengers :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      noPassenger,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'No of Bags :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      noBages,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup Time :',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      pickupTime,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        'DropOff Time / Trip Duration',
                        style: TextStyle(
                            color: tempColor.greyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  droffTime,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(
                        'Pickup location',
                        style: TextStyle(
                            color: tempColor.greyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        pickupLocation,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(
                        'Drop off location',
                        style: TextStyle(
                            color: tempColor.greyColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        drpOffLocstion,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: tempColor.greyColor,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Special Instructions',
                        style: TextStyle(
                            color: tempColor.greyColor,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        specialInstructions,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          //todo billing Detail
          Container(
              margin: const EdgeInsets.all(15.0),
              child: const CustomLinearGradientWidget(
                firstText: 'Billing',
                lastText: 'Detail',
                fontSize: 24,
              )),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: tempColor.greyColor,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip Type',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      tripType,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Est. drive time',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      estDriveTime,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Est. distance',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      estDistance,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: TextStyle(
                          color: tempColor.greyColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      totslAmount,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ])),
        ]);
  }
}
