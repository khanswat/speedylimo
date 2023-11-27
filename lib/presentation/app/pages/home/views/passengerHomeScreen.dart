import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../../utils/constants/app/app_constants.dart';
import '../../../../widgets/timepickerWidget/datepickerWidget.dart';
import '../../../../widgets/timepickerWidget/timePicker.dart';
import '../../../../widgets/widget.dart';
import '../../pages.dart';
import 'package:speedylimo/extensions/colors/colors_extension.dart';

class PassengerHomeScreen extends StatefulWidget {
  @override
  _PassengerHomeScreenState createState() => _PassengerHomeScreenState();
}

class _PassengerHomeScreenState extends State<PassengerHomeScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  int passengerCount = 0;
  int BagCount = 0;
  bool color = true;
  bool isChecked = false;
  List<Widget> containers = [];
  int index = 0;
  PickResult? fromLocation;
  PickResult? toLocation;
  PickResult? stopLocation;
  String get apiKey => 'AIzaSyAlWLuEzszKgldMmuo9JjtKLxe9MGk75_k';
  String? formattedDate;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
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
                firstText: 'BOOK',
                lastText: 'NOW',
                fontSize: 24,
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
                                onPressed: continued,
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.blue, Color(0xff00C6FF)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Continue to Step ${_currentStep + 2}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                              )
                            : _currentStep == 1
                                ? Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextButton(
                                          onPressed: continued,
                                          child: Container(
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
                                              onTap: fromLocation == null
                                                  ? () {
                                                      ScaffoldMessenger.of(
                                                          context)
                                                        ..hideCurrentSnackBar()
                                                        ..showSnackBar(SnackBar(
                                                          content: Text(
                                                            'Please Select Pickup & DropOff Location',
                                                          ),
                                                        ));
                                                    }
                                                  : () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return ReviewYourBookingScreen(
                                                              fromlocation:
                                                                  fromLocation
                                                                          ?.formattedAddress ??
                                                                      '',
                                                              tolocation: toLocation
                                                                      ?.formattedAddress ??
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
                                                              price: '1200',
                                                              note:
                                                                  descriptionController
                                                                      .text,
                                                              stoplocation:
                                                                  stopLocation
                                                                          ?.formattedAddress ??
                                                                      '');
                                                        },
                                                      ));
                                                    },
                                              child: Container(
                                                decoration: fromLocation == null
                                                    ? BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            Colors.grey,
                                                            Colors.grey.shade400
                                                          ],
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5.0),
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
                                                                .circular(5.0),
                                                      ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
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
                                                    fontWeight: FontWeight.bold,
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
                        'WHEN IS YOUR TRIPS?',
                        style: TextStyle(color: Colors.blue),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomLinearGradientWidget(
                                  firstText: 'PICKUP',
                                  lastText: 'DATE:',
                                  fontSize: 18,
                                ),
                                Container(
                                  // color: const Color(0xff585858),
                                  child: DatePickerWidget(
                                    fillColor: Colors.white70,
                                    labelStyle: TextStyle(color: Colors.black),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomLinearGradientWidget(
                                  firstText: 'PICKUP',
                                  lastText: ' TIME:',
                                  fontSize: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const CustomLinearGradientWidget(
                                      firstText: '# of',
                                      lastText: 'PASSENGERS:',
                                      fontSize: 18,
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
                                              size: 35,
                                              color: Colors.black,
                                            )),
                                        Text(
                                          passengerCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                passengerCount++;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.arrow_right,
                                              size: 35,
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
                                      firstText: '# of',
                                      lastText: 'BAGES:',
                                      fontSize: 18,
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
                                              size: 35,
                                              color: Colors.black,
                                            )),
                                        Text(
                                          BagCount.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                BagCount++;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.arrow_right,
                                              size: 35,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      color = false;
                                      isChecked = true;
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
                                          'POINT-TO-POINT',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                                        fontSize: 18),
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
                                          'AS DIRECTED',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                          //todo point to  point container
                          Container(
                            child: isChecked == true
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
                                              firstText: 'ENTER',
                                              lastText: ' DROPOFF:',
                                              fontSize: 15,
                                            ),
                                            Container(
                                              child: TimePickerWidget(
                                                fillColor: Colors.white70,
                                                textColor: Colors.black,
                                                borderColor: Colors.white70,
                                                size: 18,
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
                                              firstText: 'TRIP',
                                              lastText: 'DURATION:',
                                              fontSize: 15,
                                            ),
                                            Container(
                                              // color: const Color(0xff585858),
                                              child: TimePickerWidget(
                                                fillColor: Colors.white70,
                                                textColor: Colors.black,
                                                borderColor: Colors.white70,
                                                size: 18,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                      colors: [Colors.blue, Color(0xff00C6FF)],
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                      child: TextButton(
                                    onPressed: () {
                                      containers.add(Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                flex: 3,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(context,
                                                          MaterialPageRoute(
                                                        builder: (context) {
                                                          return PlacePicker(
                                                            apiKey: apiKey,

                                                            initialPosition:
                                                                LatLng(
                                                                    -33.8567844,
                                                                    151.213108),
                                                            useCurrentLocation:
                                                                true,
                                                            selectInitialPosition:
                                                                true,

                                                            //usePlaceDetailSearch: true,
                                                            onPlacePicked:
                                                                (result) {
                                                              setState(() {
                                                                stopLocation =
                                                                    result;
                                                              });

                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          );
                                                        },
                                                      ));
                                                    },
                                                    child: Container(
                                                      color:
                                                          tempColor.whiteColor,
                                                      child: InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'enter stop point'
                                                                  .toUpperCase(),
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
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
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      containers
                                                          .removeAt(index);
                                                    });
                                                  },
                                                  child: Container(
                                                    height: 40,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            2,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      gradient: LinearGradient(
                                                        colors: [
                                                          Colors.blue,
                                                          Color(0xff00C6FF)
                                                        ],
                                                        begin: Alignment
                                                            .centerLeft,
                                                        end: Alignment
                                                            .centerRight,
                                                      ),
                                                    ),
                                                    child: const Center(
                                                      child: Text(
                                                        'Remove',
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
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ));
                                      setState(() {});
                                    },
                                    child: const Text(
                                      '+ ADD STOP ',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
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
                                Column(
                                  children: containers,
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
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white70,
                                          border: Border.all(width: 0.5),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        child: const Center(
                                            child: Text(
                                          'Price ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        )),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
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
                                          child: const Center(
                                            child: Text(
                                              'CALCULATE',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: TextFieldWidget(
                                    controller: descriptionController,
                                    hint: 'Add Note',
                                    labelText: 'Add Note',
                                    labelStyle: TextStyle(color: Colors.black),
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
    );
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
