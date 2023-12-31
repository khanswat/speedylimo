import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class AcceptedRidesWidget extends StatelessWidget {
  const AcceptedRidesWidget(
      {Key? key,
      this.pickupTime = '',
      this.driverName = '',
      this.rideID = '',
      this.time = '',
      this.totalAmount = '',
      required this.onTap,
      required this.status,
      required this.AcceptWidget,
      required this.cancelWidget})
      : super(key: key);

  final String pickupTime;
  final String driverName;
  final String rideID;
  final String totalAmount;
  final String time;
  final String status;
  final VoidCallback onTap;
  final Widget AcceptWidget;
  final Widget cancelWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Driver Name :',
                style: TextStyle(
                  color: tempColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                driverName,
                style: TextStyle(
                  color: tempColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pickup Time :',
                style: TextStyle(
                  color: tempColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                pickupTime,
                style: TextStyle(
                  color: tempColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Ride ID :',
                style: TextStyle(
                  color: tempColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                rideID,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Time :',
                style: TextStyle(
                  color: tempColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                time,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Total Amount :',
                style: TextStyle(
                  color: tempColor.greyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                totalAmount,
                style: TextStyle(
                  color: tempColor.blackColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.green,
                style: BorderStyle.solid,
                width: 1.5,
              ),
              color: tempColor.whiteColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'STATUS: $status',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: tempColor.blackColor),
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          AcceptWidget,
          const SizedBox(
            height: 10,
          ),
          cancelWidget,
          // GestureDetector(
          //   onTap: onTapCancel,
          //   child: Container(
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: Colors.red,
          //         style: BorderStyle.solid,
          //         width: 1.5,
          //       ),
          //       color: tempColor.whiteColor,
          //       borderRadius: BorderRadius.circular(30.0),
          //     ),
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Center(
          //           child: Text(
          //         'CANCLE RIDE',
          //         style: TextStyle(
          //             fontSize: 14,
          //             fontWeight: FontWeight.bold,
          //             color: tempColor.blackColor),
          //       )),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Center(
                    child: Text(
                  'VIEW DETAILS',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
