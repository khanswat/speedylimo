import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class D_AcceptedRidesWidget extends StatelessWidget {
  const D_AcceptedRidesWidget({
    Key? key,
    this.pickupTime = '',
    this.passengerName = '',
    required this.rideID,
    required this.onTap,
    required this.completeWidget,
    required this.cancelWidget,
  }) : super(key: key);

  final String pickupTime;
  final String passengerName;
  final String rideID;

  final GestureTapCallback onTap;

  final Widget completeWidget;
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
                'Passenger Name :',
                style: TextStyle(
                    color: tempColor.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                passengerName,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
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
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                pickupTime,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
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
                'Ride ID : :',
                style: TextStyle(
                    color: tempColor.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                rideID,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
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
                      fontWeight: FontWeight.w600,
                      fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
                )),
              ),
            ),
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
              child: const Center(
                  child: Text(
                'STATUS: ONGOING',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          cancelWidget,
          const SizedBox(
            height: 10,
          ),
          completeWidget
        ],
      ),
    );
  }
}
