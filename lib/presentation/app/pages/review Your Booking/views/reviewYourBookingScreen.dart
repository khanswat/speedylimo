import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:speedylimo/business_logic/cubits/cubits.dart';
import 'package:speedylimo/data/data.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showSuffix = false;
  int _selectedValue = 1;
  var paymentId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    paymentId = context.read<UserCubit>().state.paymentID.toString();
    return BlocProvider(
      create: (context) => UserCubit(),
      child: Scaffold(
          key: _scaffoldKey,
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
                        widget.bookStatus == 0
                            ? 'Point to Point'
                            : 'As Directed',
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
                  context.read<UserCubit>().state.paymentID != null
                      ? BlocConsumer<BooknowCubit, BooknowState>(
                          listener: (BuildContext context, Object? state) {
                            if (state is BookNowError) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: tempColor.redColor,
                                    content: Text('Error'),
                                  ),
                                );
                            }
                            if (state is BookNowLoaded) {
                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(
                                  SnackBar(
                                    backgroundColor: tempColor.blueColor,
                                    content: Text('Booked Successfully!!!'),
                                  ),
                                );
                            }
                          },
                          builder: (context, state) {
                            return Column(
                              children: [
                                ButtonWidget(
                                  cornerRadius: 5.0,
                                  key: const Key(
                                      'loginForm_continue_raisedButton'),
                                  height: 60,
                                  childWidget: Text(
                                    'Book Now',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                  onPressed: () {
                                    context.read<BooknowCubit>().PostBookNow(
                                        calendar: widget.pickupdate,
                                        pickuptime: widget.pickuptime,
                                        bags: widget.bags,
                                        passenger: widget.passengers,
                                        bookingType:
                                            widget.bookStatus == 0 ? '1' : '2',
                                        as_directed: widget.bookStatus == 0
                                            ? 'Point to Point'
                                            : 'As Directed',
                                        time: DateTime.now().toString(),
                                        pickuplocation: widget.fromlocation,
                                        dropoffLocation: widget.tolocation,
                                        totaltripTime: widget.totalDriveTime,
                                        miles: widget.distance,
                                        amount: widget.price,
                                        instruction: widget.note,
                                        paymentID: paymentId,
                                        latlng:
                                            '[{"latitude":24.8607343,"longitude":67.0011364},{"latitude":31.5203696,"longitude":74.35874729999999}]');
                                  },
                                ),
                              ],
                            );
                          },
                        )
                      : GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(
                                  MaterialPageRoute(
                                    builder: (BuildContext context1) => UsePaypal(
                                        sandboxMode: true,
                                        clientId: Constants.clientId,
                                        secretKey: Constants.secretKey,
                                        returnURL: Constants.returnURL,
                                        cancelURL: Constants.cancelURL,
                                        transactions: [
                                          {
                                            'amount': {
                                              'total': '${widget.price ?? ''}',
                                              'currency': 'USD',
                                            }
                                          }
                                        ],
                                        note: 'Contact us for any questions on your Ride.',
                                        onSuccess: (Map params) {
                                          print('onSuccess: $params');
                                          print(params['paymentId']);

                                          setState(() {
                                            context.read<UserCubit>().paymentID(
                                                params['paymentId'].toString());
                                          });
                                        },
                                        onError: (error) {
                                          // ignore: prefer_single_quotes
                                          print("onError: $error");
                                        },
                                        onCancel: (cancel) {
                                          print('cancelled: $cancel');
                                        }),
                                  ),
                                )
                                .then((value) => context.read<UserCubit>());
                          },
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
          ]))),
    );
  }
}
