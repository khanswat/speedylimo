import 'package:flutter/material.dart';
import 'package:speedylimo/data/paypal/constants.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../widgets/Widget.dart';
import 'package:speedylimo/presentation/presentation.dart';
import '/utils/utils.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class ReviewYourBookingScreen extends StatefulWidget {
  final dynamic fromlocation;
  final dynamic tolocation;
  final dynamic stoplocation;
  final dynamic pickupdate;
  final dynamic pickuptime;
  final dynamic passengers;
  final dynamic bags;
  final dynamic price;
  final dynamic note;
  final dynamic distance;
  final dynamic totalDriveTime;
  final dynamic bookStatus;
  ReviewYourBookingScreen(
      {Key? key,
      this.fromlocation,
      this.bags,
      this.note,
      this.passengers,
      this.pickupdate,
      this.pickuptime,
      this.price,
      this.distance,
      this.bookStatus,
      this.totalDriveTime,
      this.stoplocation,
      this.tolocation})
      : super(key: key);

  @override
  State<ReviewYourBookingScreen> createState() =>
      _ReviewYourBookingScreenState();
}

class _ReviewYourBookingScreenState extends State<ReviewYourBookingScreen> {
  TextEditingController emailController = TextEditingController();
  bool showSuffix = false;
  int _selectedValue = 1;

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      if (emailController.text.isEmpty) {
        showSuffix = false;
      } else {
        showSuffix = true;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // double totalTimeInSeconds = widget.speed;
    // Convert total time to hours and minutes
    // int hours = totalTimeInSeconds ~/ 3600;
    // int minutes = ((totalTimeInSeconds % 3600) ~/ 60).toInt();
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: false,
              showback: true,
              logo: false,
              title1: 'Review Your',
              title2: 'Booking',
              name: ' ',
            )),
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          //todo email form
          Container(
            padding: EdgeInsets.all(10),
            child: CustomLinearGradientWidget(
              firstText: 'Booking',
              lastText: 'Detail',
              fontSize: 22,
            ),
          ),
          //todo date & time
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                      'Pickup Date:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.pickupdate,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
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
                      'Pickup Time:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      widget.pickuptime,
                      style: TextStyle(
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
          //todo passenger & bags
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                      '# of Passengers:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${widget.passengers}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
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
                      '# of Bags:',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '${widget.bags}',
                      style: TextStyle(
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
          //todo pickup
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Pickup location',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.fromlocation,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //todo dropoff
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Drop off location',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.tolocation,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          widget.stoplocation != ''
              ? Container(
                  margin: EdgeInsets.all(10.0),
                  padding: EdgeInsets.all(20),
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Stops',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        widget.stoplocation,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          //todo instructions
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                    Text(
                      'Special Instructions',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.note,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //todo billing details
          Container(
              padding: EdgeInsets.all(10),
              child: CustomLinearGradientWidget(
                firstText: 'Billing',
                lastText: 'Detail',
                fontSize: 22,
              )),
          Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(20),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trip Type',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      widget.bookStatus == 0 ? 'Point to Point' : 'As Directed',
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                      'Est. drive time',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      widget.totalDriveTime,
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                      'Est. distance',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      '${widget.distance} miles',
                      style: TextStyle(color: Colors.black, fontSize: 15),
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
                      'Total Amount',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      'USD ${widget.price ?? ''}',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () =>  Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => UsePaypal(
                                sandboxMode: true,
                               clientId: Constants.clientId,
                                        secretKey: Constants.secretKey,
                                        returnURL: Constants.returnURL,
                                        cancelURL: Constants.cancelURL,
                                        transactions:   [
                                          {
                                            'amount': {
                                              'total':'${widget.price ?? ''}',
                                              'currency': 'USD',
                                           }
                                          }
                                        ],
                                 note: 'Contact us for any questions on your Ride.',
                                onSuccess: (Map params) async {
                                  print('onSuccess: $params');
                                 setState(() {
                                  
                                 });

                                },
                                onError: (error) {
                                  print("onError: $error");
                                },
                                onCancel: (params) {
                                  print('cancelled: $params');
                                }),
                          ),
                        ),
                  child: Container(
                    height: 50,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.amber,
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: CustomLinearGradientWidget(
                      firstText: 'Pay',
                      lastText: 'Pal',
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: 50,
                    // color: Colors.amber,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: Colors.black,
                      border: Border.all(
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.credit_card_outlined,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Debit or Credit Card',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ])));
  }
}
