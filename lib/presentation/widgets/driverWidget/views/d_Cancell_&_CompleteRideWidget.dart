import '../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class D_CancleAndCompleteWidget extends StatelessWidget {
  const D_CancleAndCompleteWidget({
    Key? key,
    this.pickupTime = '',
    this.passengerName = '',
    this.status = '',
    required this.onTap1,
    required this.onTap,
  }) : super(key: key);

  final String pickupTime;
  final String passengerName;
  final String status;
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
                'Passenger Name :',
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 16,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                passengerName,
                style: TextStyle(
                    color: tempColor.blackColor,
                    fontSize: 18,
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
                    color: tempColor.blackColor,
                    fontSize: 18,
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
                  color: Colors.grey,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                  child: Text(
                'VIEW DETAILS',
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
              child: Center(
                  child: Text(
                status,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'lib/assets/font/AbrilFatface-Regular.ttf'),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
