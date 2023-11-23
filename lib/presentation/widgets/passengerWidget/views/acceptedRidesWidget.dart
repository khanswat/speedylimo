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
      required this.onTap2,
      required this.onTap1})
      : super(key: key);

  final String pickupTime;
  final String driverName;
  final String rideID;
  final String totalAmount;
  final String time;
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
                'Driver Name :',
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
                driverName,
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
                'Ride ID : :',
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
                myride,
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
                'Time : ',
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
                time,
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
                'Total Amount : ',
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
                totalAmount,
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
                'STATUS: ONGOING',
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
                'COMPLETE RIDE',
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
            onTap: onTap2,
            child: Container(
              height: 50,
              width: 500,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                  style: BorderStyle.solid,
                  width: 1.5,
                ),
                color: tempColor.whiteColor,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: const Center(
                  child: Text(
                'CANCLE RIDE',
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
