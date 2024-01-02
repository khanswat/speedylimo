import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:intl/intl.dart';
import 'package:speedylimo/business_logic/cubits/cubits.dart';
import 'package:speedylimo/services/navigation/navigation_service.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../widgets/timepickerWidget/datepickerWidget.dart';
import '../../../../widgets/timepickerWidget/timePicker.dart';
import '../../../../widgets/widget.dart';
import '../../pages.dart';
import 'package:speedylimo/extensions/colors/colors_extension.dart';
import 'package:http/http.dart' as http;

class PassengerHomeScreen extends StatefulWidget {
  @override
  _PassengerHomeScreenState createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  final Dio _dio = Dio();
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int passengerCount = 0;
  int BagCount = 0;
  bool color = false;
  bool isChecked = true;
  bool isLoading = false;
  bool checkedValue = false;

  int index = 0;
  PickResult? fromLocation;
  PickResult? toLocation;
  PickResult? stopLocation;
  int? bookTypeStatus;
  List<Widget> containers = [];
  var TotalDistance;
  var totalDriveTime;
  double totalDistance = 0.0;

  String get apiKey => 'AIzaSyAlWLuEzszKgldMmuo9JjtKLxe9MGk75_k';
  String? formattedDate;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  TextEditingController descriptionController = TextEditingController();

  String formatDuration(int totalDurationInSeconds) {
    var duration = Duration(seconds: totalDurationInSeconds);
    var hours = duration.inHours;
    var minutes = (duration.inMinutes % 60);
    var formattedDuration = '$hours hours $minutes mins';
    return formattedDuration;
  }

  double convertKmToMiles(String kilometers) {
    var km = double.tryParse(kilometers.replaceAll(' km', '')) ?? 0.0;
    var conversionFactor = 0.621371;
    var miles = km * conversionFactor;

    return miles;
  }

  Future<Map<String, dynamic>> getDirections(
      String origin, List<String?> stops, String destination) async {
    var validStops =
        stops.where((stop) => stop != null && stop != '0.0,0.0').toList();
    var waypointsParam = validStops.isNotEmpty
        ? '&waypoints=${validStops.map((waypoint) => 'via:$waypoint').join('|')}'
        : '';

    var url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=$origin&destination=$destination$waypointsParam&key=$apiKey';

    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);

      if (data['status'] == 'OK') {
        List<dynamic> routes = data['routes'];
        if (routes.isNotEmpty) {
          String totalDistance = '';
          int totalDuration = 0;

          for (var route in routes) {
            for (var leg in route['legs']) {
              totalDistance += leg['distance']['text'];
              totalDuration = leg['duration']['value'];
            }
          }

          // Convert distance to miles
          var distanceInMiles = convertKmToMiles(totalDistance);

          print(data);

          return {
            'distance': distanceInMiles.round(),
            'duration': formatDuration(totalDuration),
          };
        }
      }
    }

    return {'distance': '0', 'duration': '0'};
  }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1996),
        lastDate: DateTime(2030));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd MMM, yyyy').format(selectedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PriceCubit, PriceState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? ''),
                backgroundColor: tempColor.redColor,
              ),
            );
        }
        if (state.status.isSubmissionSuccess) {}
      },
      child: Scaffold(
        endDrawer: NavDrawer(context),
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBarWidget(
              isshow: true,
              showback: false,
              logo: true,
              title1: '',
              title2: '',
              name: '',
            )),
        body: Theme(
          data: Theme.of(
            context,
          ).copyWith(colorScheme: ColorScheme.light(primary: Colors.blue)),
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                CustomLinearGradientWidget(
                  firstText: 'Book',
                  lastText: 'Now',
                  fontSize: 18,
                ),
                Expanded(
                  child: Stepper(
                    type: stepperType,
                    physics: ScrollPhysics(),
                    currentStep: _currentStep,
                    onStepTapped: (step) => tapped(step),
                    controlsBuilder: (context, _) {
                      return Row(
                        children: <Widget>[
                          _currentStep == 0
                              ? TextButton(
                                  onPressed:
                                      fromLocation != null ? continued : null,
                                  child: Container(
                                    margin: EdgeInsets.only(top: 10),
                                    width: 200,
                                    height: 37,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: fromLocation != null
                                            ? [Colors.blue, Color(0xff00C6FF)]
                                            : [Colors.grey, Colors.grey],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Center(
                                        child: Text(
                                          'Continue to Step ${_currentStep + 2}',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : _currentStep == 1
                                  ? Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: continued,
                                            child: Container(
                                              width: 200,
                                              height: 37,
                                              decoration: BoxDecoration(
                                                gradient: LinearGradient(
                                                  colors: [
                                                    Colors.blue,
                                                    Color(0xff00C6FF)
                                                  ],
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    'Continue to Step ${_currentStep + 2}',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 14),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          OutlinedButton(
                                            onPressed: cancel,
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0))),
                                            ),
                                            child: const Text(
                                              'Back',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : _currentStep >= 2
                                      ? Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: context
                                                            .read<UserCubit>()
                                                            .state
                                                            .priceModel
                                                            ?.price ==
                                                        null
                                                    ? () {
                                                        ScaffoldMessenger.of(
                                                            context)
                                                          ..hideCurrentSnackBar()
                                                          ..showSnackBar(
                                                              SnackBar(
                                                            content: Text(
                                                              'Please Calculate Price',
                                                            ),
                                                          ));
                                                      }
                                                    : () {
                                                        Navigator.push(context,
                                                            MaterialPageRoute(
                                                          builder: (context) {
                                                            return ReviewYourBookingScreen(
                                                                fromlocation:
                                                                    fromLocation?.formattedAddress ??
                                                                        '',
                                                                tolocation:
                                                                    toLocation?.formattedAddress ??
                                                                        '',
                                                                pickupdate:
                                                                    formattedDate ??
                                                                        '',
                                                                pickuptime:
                                                                    selectedTime
                                                                        .format(
                                                                            context),
                                                                passengers:
                                                                    passengerCount,
                                                                bags: BagCount,
                                                                price: context
                                                                        .read<
                                                                            UserCubit>()
                                                                        .state
                                                                        .priceModel
                                                                        ?.price ??
                                                                    '',
                                                                distance:
                                                                    TotalDistance ??
                                                                        '',
                                                                totalDriveTime:
                                                                    totalDriveTime ??
                                                                        '',
                                                                note: descriptionController
                                                                    .text,
                                                                stoplocation:
                                                                    stopLocation
                                                                            ?.formattedAddress ??
                                                                        '',
                                                                bookStatus:
                                                                    bookTypeStatus ??
                                                                        0);
                                                          },
                                                        ));
                                                      },
                                                child: Container(
                                                  width: 200,
                                                  height: 37,
                                                  decoration: context
                                                              .read<UserCubit>()
                                                              .state
                                                              .priceModel
                                                              ?.price ==
                                                          null
                                                      ? BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Colors.grey,
                                                              Colors
                                                                  .grey.shade400
                                                            ],
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        )
                                                      : BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            colors: [
                                                              Colors.blue,
                                                              Color(0xff00C6FF)
                                                            ],
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: const Center(
                                                      child: Text(
                                                        'SUBMIT',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 14),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              OutlinedButton(
                                                onPressed: cancel,
                                                style: ButtonStyle(
                                                  shape:
                                                      MaterialStateProperty.all(
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0))),
                                                ),
                                                child: const Text(
                                                  'Back',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : OutlinedButton(
                                          onPressed: cancel,
                                          style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0))),
                                          ),
                                          child: const Text(
                                            'Back',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                        ],
                      );
                    },
                    steps: <Step>[
                      Step(
                        title: Text(
                          'WHEN IS YOUR TRIP?',
                          style: TextStyle(color: Colors.blue, fontSize: 14),
                        ),
                        content: Column(
                          children: <Widget>[
                            //todo location
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return PlacePicker(
                                              apiKey: apiKey,

                                              initialPosition: LatLng(
                                                  -33.8567844, 151.213108),
                                              useCurrentLocation: true,
                                              selectInitialPosition: true,

                                              //usePlaceDetailSearch: true,
                                              onPlacePicked: (result) {
                                                setState(() {
                                                  fromLocation = result;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        ));
                                      },
                                      child: Container(
                                        color: tempColor.whiteColor,
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            labelText:
                                                'Select Your PickUp Location'
                                                    .toUpperCase(),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                              '${fromLocation?.formattedAddress ?? 'FROM'}'),
                                        ),
                                      )),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return PlacePicker(
                                              apiKey: apiKey,

                                              initialPosition: LatLng(
                                                  -33.8567844, 151.213108),
                                              useCurrentLocation: true,
                                              selectInitialPosition: true,

                                              //usePlaceDetailSearch: true,
                                              onPlacePicked: (result) {
                                                setState(() {
                                                  toLocation = result;
                                                });

                                                Navigator.of(context).pop();
                                              },
                                            );
                                          },
                                        ));
                                      },
                                      child: Container(
                                        color: tempColor.whiteColor,
                                        child: InputDecorator(
                                          decoration: InputDecoration(
                                            labelText:
                                                'Select Your DropOff Location'
                                                    .toUpperCase(),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                              '${toLocation?.formattedAddress ?? 'TO'}'),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //todo Date
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomLinearGradientWidget(
                                    firstText: 'Pickup',
                                    lastText: 'Date :',
                                    fontSize: 14,
                                  ),
                                  Container(
                                    // color: const Color(0xff585858),
                                    child: DatePickerWidget(
                                      fillColor: Colors.white70,
                                      labelStyle: TextStyle(
                                          color: Colors.blue, fontSize: 14),
                                      selectDate: formattedDate ??
                                          '${selectedDate.toLocal()}'
                                              .split(' ')[0],
                                      onTap: () async {
                                        await _selectDate(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //todo time
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomLinearGradientWidget(
                                    firstText: 'Pickup',
                                    lastText: 'Time :',
                                    fontSize: 14,
                                  ),
                                  Container(
                                    // color: const Color(0xff585858),
                                    child: TimePickerWidget(
                                      fillColor: Colors.white70,
                                      textColor: Colors.black,
                                      borderColor: Colors.white70,
                                      selecTime: selectedTime.format(context),
                                      onSelected: () async {
                                        await _selectTime(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            //todo NO.of passenger
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomLinearGradientWidget(
                                        firstText: '# Of',
                                        lastText: 'Passengers :',
                                        fontSize: 14.0,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passengerCount--;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_left,
                                                size: 25,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            passengerCount.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  passengerCount++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_right,
                                                size: 25,
                                                color: Colors.black,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const CustomLinearGradientWidget(
                                        firstText: '# Of',
                                        lastText: 'Bags :',
                                        fontSize: 14,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  BagCount--;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_left,
                                                size: 25,
                                                color: Colors.black,
                                              )),
                                          Text(
                                            BagCount.toString(),
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  BagCount++;
                                                });
                                              },
                                              icon: const Icon(
                                                Icons.arrow_right,
                                                size: 25,
                                                color: Colors.black,
                                              ))
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ), //kindes of trips
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 0
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text(
                          'WHAT KIND OF TRIP IS THIS?',
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        color = false;
                                        isChecked = true;
                                        bookTypeStatus = 0;
                                        checkedValue = false;
                                      });
                                    },
                                    child: Container(
                                      color: color == false
                                          ? Colors.blue
                                          : const Color(0xff585858),
                                      child: const Center(
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Text(
                                            'Point-To-Point',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: <Widget>[
                                    Expanded(
                                        child: Divider(
                                      thickness: 1,
                                    )),
                                    Text(
                                      ' OR ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Expanded(
                                        child: Divider(
                                      thickness: 1,
                                    )),
                                  ]),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        color = true;
                                        isChecked = false;
                                        bookTypeStatus = 1;
                                      });
                                    },
                                    child: Container(
                                      color: color == true
                                          ? Colors.blue
                                          : const Color(0xff585858),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: const Center(
                                          child: Text(
                                            'As Directed',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            isChecked == false
                                ? Container(
                                    padding: EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: tempColor.lightGreyColor,
                                        style: BorderStyle.solid,
                                        width: 1.5,
                                      ),
                                      color: Color(0xffEBF2F8),
                                      borderRadius: BorderRadius.circular(6.0),
                                    ),
                                    child: Center(
                                      child: CheckboxListTile(
                                        contentPadding: EdgeInsets.zero,

                                        title: Text(
                                          'Enter DropOff Time / Trip Duration',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: tempColor.blackColor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        value: checkedValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            checkedValue = newValue!;
                                          });
                                        },
                                        controlAffinity: ListTileControlAffinity
                                            .leading, //  <-- leading Checkbox
                                      ),
                                    ))
                                : SizedBox(),
                            SizedBox(
                              height: 10,
                            ),
                            //todo point to  point container
                            Container(
                              child: checkedValue == true && isChecked == false
                                  ? Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: tempColor.lightGreyColor,
                                              style: BorderStyle.solid,
                                              width: 1.5,
                                            ),
                                            color: Color(0xffEBF2F8),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CustomLinearGradientWidget(
                                                firstText: 'DropOff',
                                                lastText: ' Time :',
                                                fontSize: 14,
                                              ),
                                              Container(
                                                child: TimePickerWidget(
                                                  fillColor: Colors.white70,
                                                  textColor: Colors.black,
                                                  borderColor: Colors.white70,
                                                  size: 14,
                                                  selecTime: selectedTime
                                                      .format(context),
                                                  onSelected: () async {
                                                    await _selectTime(context);
                                                  },
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
                                              color: tempColor.lightGreyColor,
                                              style: BorderStyle.solid,
                                              width: 1.5,
                                            ),
                                            color: Color(0xffEBF2F8),
                                            borderRadius:
                                                BorderRadius.circular(6.0),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const CustomLinearGradientWidget(
                                                firstText: 'Trip',
                                                lastText: 'Duration :',
                                                fontSize: 14,
                                              ),
                                              Container(
                                                // color: const Color(0xff585858),
                                                child: TimePickerWidget(
                                                  fillColor: Colors.white70,
                                                  textColor: Colors.black,
                                                  borderColor: Colors.white70,
                                                  size: 14,
                                                  selecTime: selectedTime
                                                      .format(context),
                                                  onSelected: () async {
                                                    await _selectTime(context);
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : null,
                            )
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 1
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: Text(
                          'WHERE ARE YOU GOING?',
                          style: TextStyle(color: Colors.blue),
                        ),
                        content: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      // border: Border.all(
                                      //   style: BorderStyle.solid,
                                      //   width: 1.5,
                                      // ),

                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.blue,
                                          Color(0xff00C6FF)
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Center(
                                        child: TextButton(
                                      onPressed: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return PlacePicker(
                                              apiKey: apiKey,

                                              initialPosition: LatLng(
                                                  -33.8567844, 151.213108),
                                              useCurrentLocation: true,
                                              selectInitialPosition: true,

                                              //usePlaceDetailSearch: true,
                                              onPlacePicked: (result) {
                                                setState(() {
                                                  stopLocation = result;
                                                });

                                                NavigationService.instance
                                                    .goBack();
                                              },
                                            );
                                          },
                                        )).then((value) => addDynamicWidget());
                                      },
                                      child: const Text(
                                        '+ ADD STOP ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return PlacePicker(
                                            apiKey: apiKey,

                                            initialPosition:
                                                LatLng(-33.8567844, 151.213108),
                                            useCurrentLocation: true,
                                            selectInitialPosition: true,

                                            //usePlaceDetailSearch: true,
                                            onPlacePicked: (result) {
                                              setState(() {
                                                fromLocation = result;
                                              });

                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      color: tempColor.whiteColor,
                                      child: InputDecorator(
                                        decoration: InputDecoration(
                                          // labelText: 'choose starting point'
                                          //     .toUpperCase(),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                            '${fromLocation?.formattedAddress ?? 'CHOOSE STARTING POINT'}'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: containers.length,
                                    itemBuilder: (context, index) {
                                      return containers[index];
                                    },
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(
                                        builder: (context) {
                                          return PlacePicker(
                                            apiKey: apiKey,

                                            initialPosition:
                                                LatLng(-33.8567844, 151.213108),
                                            useCurrentLocation: true,
                                            selectInitialPosition: true,

                                            //usePlaceDetailSearch: true,
                                            onPlacePicked: (result) {
                                              setState(() {
                                                toLocation = result;
                                              });

                                              Navigator.of(context).pop();
                                            },
                                          );
                                        },
                                      ));
                                    },
                                    child: Container(
                                      color: tempColor.whiteColor,
                                      child: InputDecorator(
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                5,
                                              ),
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                            '${toLocation?.formattedAddress ?? 'CHOOSE END POINT'}'),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.white70,
                                            border: Border.all(width: 0.5),
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                          ),
                                          child: Center(
                                              child: Text(
                                            'Price:  \$ ${context.read<UserCubit>().state.priceModel?.price ?? 0.0}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          )),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      BlocBuilder<PriceCubit, PriceState>(
                                        builder: (context, state) {
                                          return Expanded(
                                            child: ButtonWidget(
                                              cornerRadius: 5.0,
                                              key: const Key(
                                                  'loginForm_continue_raisedButton'),
                                              isLoading: state.status
                                                      .isSubmissionInProgress
                                                  ? false
                                                  : (!state.status
                                                          .isSubmissionInProgress
                                                      ? false
                                                      : true),
                                              isOutline: state.status
                                                      .isSubmissionInProgress
                                                  ? true
                                                  : false,
                                              height: 40,
                                              childWidget: state.status
                                                      .isSubmissionInProgress
                                                  ? const Center(
                                                      child: SizedBox(
                                                          height: 23,
                                                          width: 23,
                                                          child:
                                                              CircularProgressIndicator()),
                                                    )
                                                  : Text(
                                                      'Calculate',
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.white),
                                                    ),
                                              onPressed: () async {
                                                final origin =
                                                    '${fromLocation?.geometry?.location.lat ?? 0.0},${fromLocation?.geometry?.location.lng ?? 0.0}'; // San Francisco, CA
                                                final destination =
                                                    '${toLocation?.geometry?.location.lat ?? 0.0},${toLocation?.geometry?.location.lng ?? 0.0}';
                                                var waypoints = [
                                                  '${stopLocation?.geometry?.location.lat ?? 0.0},${stopLocation?.geometry?.location.lng ?? 0.0}'
                                                ];

                                                var distance =
                                                    await getDirections(origin,
                                                        waypoints, destination);

                                                print(
                                                    'Total Distance: ${distance['distance']}');
                                                print(
                                                    'Total Duration: ${distance['duration']}');

                                                await context
                                                    .read<PriceCubit>()
                                                    .getPrice(
                                                        miles:
                                                            '${distance['distance']}')
                                                    .then((value) => {
                                                          setState(
                                                            () {
                                                              TotalDistance =
                                                                  distance[
                                                                          'distance']
                                                                      .toString();
                                                              totalDriveTime =
                                                                  distance[
                                                                          'duration']
                                                                      .toString();
                                                            },
                                                          )
                                                        });
                                              },
                                            ),
                                          );
                                        },
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
                                  color: tempColor.lightGreyColor,
                                  style: BorderStyle.solid,
                                  width: 1.5,
                                ),
                                color: Color(0xffEBF2F8),
                                borderRadius: BorderRadius.circular(6.0),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: TextFieldWidget(
                                      controller: descriptionController,
                                      hint: 'Add Note',
                                      labelText: 'Add Note',
                                      fillColor: tempColor.whiteColor,
                                      labelStyle:
                                          TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                        isActive: _currentStep >= 0,
                        state: _currentStep >= 2
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addDynamicWidget() {
    containers.add(Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 3,
                child: Container(
                  color: tempColor.whiteColor,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'enter stop point'.toUpperCase(),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            5,
                          ),
                        ),
                      ),
                    ),
                    child: Text(
                        '${stopLocation?.formattedAddress ?? 'Enter Point'}'),
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: InkWell(
                onTap: () async {
                  final origin =
                      '${fromLocation?.geometry?.location.lat ?? 0.0},${fromLocation?.geometry?.location.lng ?? 0.0}'; // San Francisco, CA
                  final destination =
                      '${toLocation?.geometry?.location.lat ?? 0.0},${toLocation?.geometry?.location.lng ?? 0.0}';
                  var waypoints = ['${0.0},${0.0}'];

                  var distance =
                      await getDirections(origin, waypoints, destination);

                  print('Total Distance: ${distance['distance']}');
                  print('Total Duration: ${distance['duration']}');

                  await context
                      .read<PriceCubit>()
                      .getPrice(miles: '${distance['distance']}')
                      .then((value) => {
                            setState(
                              () {
                                TotalDistance = distance['distance'].toString();
                                totalDriveTime =
                                    distance['duration'].toString();
                              },
                            )
                          });
                  setState(() {
                    containers.removeAt(index);
                    stopLocation = null;
                    stopLocation?.formattedAddress == '';
                  });
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    gradient: LinearGradient(
                      colors: [Colors.blue, Color(0xff00C6FF)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Remove',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        )
      ],
    ));

    setState(() {});
  }

  void tapped(int step) {
    setState(() => _currentStep = step);
  }

  void continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  void cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }
}
