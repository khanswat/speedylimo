import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class D_MyRideWidget extends StatelessWidget {
  const D_MyRideWidget(
      {Key? key,
      this.pickupTime = '',
      this.passengerName = '',
      required this.onTap,
      required this.onTap2,
      required this.onTap1})
      : super(key: key);

  final String pickupTime;
  final String passengerName;

  final GestureTapCallback onTap;
  final GestureTapCallback onTap1;
  final GestureTapCallback onTap2;

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
            height: 15,
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
                  'STATUS: CLIENT WAITING',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
                )),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: onTap1,
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
            height: 15,
          ),
          InkWell(
            onTap: onTap2,
            child: Container(
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
                  'CLICK TO ACCEPT',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }
}
