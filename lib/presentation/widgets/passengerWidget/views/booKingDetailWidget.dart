import 'package:speedylimo/presentation/presentation.dart';

import '../../../../utils/constants/app/app_constants.dart';

import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return Column(children: [
      //todo email form
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // border: Border.all(
          //   color: tempColor.greyColor,
          //   style: BorderStyle.solid,
          //   width: 1.5,
          // ),
          color: tempColor.whiteColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: const CustomLinearGradientWidget(
                firstText: 'Booking',
                lastText: 'Detail',
                fontSize: 30,
              ),
            ),

            // const Text(
            //   "We are always in need of driver",
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                const Text(
                  "Passenger Name :",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  passengerName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
                const Text(
                  "Booking Type : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  bookingType,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
                const Text(
                  "Ride Status : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Container(
                  child: rideStatus,
                )
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                const Text(
                  "No of Passengers :",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  noPassenger,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
                const Text(
                  "No of Bags: ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  noBages,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
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
                const Text(
                  "Pickup Time : ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
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
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                  child: const Text(
                    "DropOff Time / Trip Duration",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  droffTime,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                  child: const Text(
                    "Pickup location",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
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
                  pickupLocation,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),

      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                  child: const Text(
                    "Drop off location",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
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
                  drpOffLocstion,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.all(15.0),
        padding: const EdgeInsets.all(20),
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
                  child: const Text(
                    "Special Instructions",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
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
                  specialInstructions,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
      Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            // border: Border.all(
            //   color: tempColor.greyColor,
            //   style: BorderStyle.solid,
            //   width: 1.5,
            // ),
            color: tempColor.whiteColor,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const CustomLinearGradientWidget(
            firstText: "Billing",
            lastText: "Detail",
            fontSize: 30,
          )),
      Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(20),
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
                const Text(
                  "Trip Type",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  tripType,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Est. drive time",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  estDriveTime,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Est. distance",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  estDistance,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total Amount",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                Text(
                  totslAmount,
                  style: const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ],
            ),
          ])),
    ]);
  }
}
