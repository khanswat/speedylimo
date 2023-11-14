import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyRidesWidget extends StatelessWidget {
  const MyRidesWidget(
      {Key? key,
      this.rideId = '',
      this.pickupTime = '',
      required this.onTap,
      required this.onTap1})
      : super(key: key);

  final String rideId;
  final String pickupTime;
  final GestureTapCallback onTap;
  final GestureTapCallback onTap1;

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Ride ID:",
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                rideId,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pickup Time :',
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                pickupTime,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
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
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                  child: Text(
                "STATUS: PENDING",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: onTap1,
            child: Container(
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                  child: Text(
                "VIEW",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              )),
            ),
          )
        ],
      ),
    );
  }
}
