import 'package:flutter/material.dart';
import 'package:speedylimo/presentation/widgets/timepickerWidget/timePicker.dart';
import 'package:table_calendar/table_calendar.dart';
import '/services/navigation/navigation_service.dart';
import '../../../../../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import '../../../../widgets/widget.dart';

class BookinNowSceen extends StatefulWidget {
  const BookinNowSceen({Key? key}) : super(key: key);

  @override
  State<BookinNowSceen> createState() => _BookinNowSceenState();
}

class _BookinNowSceenState extends State<BookinNowSceen> {
  TextEditingController emailController = TextEditingController();
  DateTime today = DateTime.now();
  bool showSuffix = false;
  void _onDaySelected(DateTime day, DateTime fcusedDay) {
    setState(() {
      today = day;
    });
  }

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

  int count = 0;
  int count1 = 0;
  bool color = true;
  bool isChecked = false;
  List<Widget> containers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            pinned: true,
            leading: IconButton(
                icon: const Icon(
                  Icons.filter_1,
                  color: Colors.transparent,
                ),
                onPressed: () {
                  // Do something
                }),
            floating: true,
            // snap: true,
            // elevation: 50,
            backgroundColor: Colors.grey,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: CustomLinearGradientWidget(
                  firstText: 'Booking',
                  lastText: 'From',
                  fontSize: 30,
                ),
              ),
              background: Image.asset(
                "lib/assets/icons/abput1.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(children: [
                  //todo email form
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: tempColor.t,
                          //   style: BorderStyle.solid,
                          //   width: 1.5,
                          // ),
                          color: tempColor.whiteColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: const CustomLinearGradientWidget(
                                firstText: 'Confirm Your',
                                lastText: 'Details',
                                fontSize: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Thank you for selecting Speedylimo. Please verify your booking information, as we are committed to ensuring that your digital experience is as satisfying as possible. Thank you for choosing Speedylimo.",
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      //time picker continer
                      const Center(
                        child: CustomLinearGradientWidget(
                          lastText: "WHEN IS YOUR TRIP?",
                          fontSize: 25,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        // decoration: BoxDecoration(
                        //   // border: Border.all(
                        //   //   color: tempColor.greyColor,
                        //   //   style: BorderStyle.solid,
                        //   //   width: 1.5,
                        //   // ),
                        //   // color: tempColor.whiteColor,
                        //   // borderRadius: BorderRadius.circular(5.0),
                        // ),
                        child: TableCalendar(
                            focusedDay: today,
                            rowHeight: 35,
                            onDaySelected: _onDaySelected,
                            calendarStyle: const CalendarStyle(),
                            availableGestures: AvailableGestures.all,
                            headerStyle: const HeaderStyle(
                                formatButtonVisible: false,
                                titleTextStyle: TextStyle(color: Colors.black),
                                leftChevronIcon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                ),
                                rightChevronIcon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                ),
                                titleCentered: true),
                            selectedDayPredicate: (day) =>
                                isSameDay(day, today),
                            firstDay: DateTime.utc(2023, 11, 5),
                            lastDay: DateTime.utc(2099, 11, 5)),
                      ), //time picker continer

                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tempColor.lightGreyColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                          color: tempColor.blackColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomLinearGradientWidget(
                              firstText: ' ',
                              lastText: 'PICKUP TIME:',
                              fontSize: 20,
                            ),
                            Container(
                              height: 40,
                              width: 120,
                              color: const Color(0xff585858),
                              child: const TimePickerWidget(
                                fillColor: Color(0xff585858),
                                textColor: Colors.white,
                                borderColor: Color(0xff585858),
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ), //passenger count continer
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tempColor.lightGreyColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                          color: tempColor.blackColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomLinearGradientWidget(
                                  firstText: ' ',
                                  lastText: '# of PASSENGERS',
                                  fontSize: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            count--;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_left,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      count.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_right,
                                          size: 35,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomLinearGradientWidget(
                                  firstText: ' ',
                                  lastText: '# of BAGES',
                                  fontSize: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            count1--;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_left,
                                          size: 35,
                                          color: Colors.white,
                                        )),
                                    Text(
                                      count1.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            count1++;
                                          });
                                        },
                                        icon: const Icon(
                                          Icons.arrow_right,
                                          size: 35,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ), //kindes of trips
                      const CustomLinearGradientWidget(
                        lastText: "WHAT KIND OF TRIP IS THIS?",
                        fontSize: 20,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tempColor.lightGreyColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                          color: tempColor.blackColor,
                          borderRadius: BorderRadius.circular(5.0),
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
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: color == false
                                    ? Colors.blue
                                    : const Color(0xff585858),
                                child: const Center(
                                  child: Text(
                                    "POINT-TO-POINT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
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
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                color: color == true
                                    ? Colors.blue
                                    : const Color(0xff585858),
                                child: const Center(
                                  child: Text(
                                    "AS DIRECTED",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ), //point to  point continer
                      Container(
                        child: isChecked == true
                            ? Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: tempColor.lightGreyColor,
                                        style: BorderStyle.solid,
                                        width: 1.5,
                                      ),
                                      color: tempColor.blackColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // ignore: avoid_unnecessary_containers
                                        Container(
                                          child:
                                              const CustomLinearGradientWidget(
                                            firstText: ' ',
                                            lastText:
                                                'ENTER DROPOFF / TRIP DURATION',
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: tempColor.lightGreyColor,
                                        style: BorderStyle.solid,
                                        width: 1.5,
                                      ),
                                      color: tempColor.blackColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomLinearGradientWidget(
                                          firstText: ' ',
                                          lastText: 'ENTER DROPOFF:',
                                          fontSize: 20,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 120,
                                          color: const Color(0xff585858),
                                          child: const TimePickerWidget(
                                            fillColor: Color(0xff585858),
                                            textColor: Colors.white,
                                            borderColor: Color(0xff585858),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(15.0),
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: tempColor.lightGreyColor,
                                        style: BorderStyle.solid,
                                        width: 1.5,
                                      ),
                                      color: tempColor.blackColor,
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const CustomLinearGradientWidget(
                                          firstText: ' ',
                                          lastText: 'TRIP DURATION:',
                                          fontSize: 20,
                                        ),
                                        Container(
                                          height: 30,
                                          width: 120,
                                          color: const Color(0xff585858),
                                          child: const TimePickerWidget(
                                            fillColor: Color(0xff585858),
                                            textColor: Colors.white,
                                            borderColor: Color(0xff585858),
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            : null,
                      ), //add stop
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const CustomLinearGradientWidget(
                            lastText: "WHERE ARE YOU GOING?",
                            fontSize: 20,
                          ),
                          Container(
                            height: 30,
                            width: 100,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: tempColor.blackColor,
                                style: BorderStyle.solid,
                                width: 1.5,
                              ),
                            ),
                            child: Center(
                                child: TextButton(
                              onPressed: () {
                                setState(() {
                                  containers.add(Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              height: 45,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: const Color(0xff585858),
                                              child: TextFormField(
                                                textAlign: TextAlign.start,
                                                style: const TextStyle(
                                                    color: Colors.white),
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'ENTER STOP POINT',
                                                  hintStyle: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                  labelStyle: TextStyle(
                                                      color: Colors.white),
                                                  border: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors
                                                          .white, // Change border color
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  containers.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                height: 45,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Colors.blue,
                                                      Color(0xff00C6FF)
                                                    ],
                                                    begin: Alignment.centerLeft,
                                                    end: Alignment.centerRight,
                                                  ),
                                                ),
                                                child: const Center(
                                                  child: Text(
                                                    "Remove",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
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
                                });
                              },
                              child: const Text(
                                "+ ADD STOP ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            )),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tempColor.lightGreyColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                          color: tempColor.blackColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 45,
                              color: const Color(0xff585858),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'CHOOSE STARTING POINT',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Colors.white, // Change border color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Column(
                              children: containers,
                            ),
                            Container(
                              height: 45,
                              color: const Color(0xff585858),
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  hintText: 'CHOOSE END POINT',
                                  hintStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          Colors.white, // Change border color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 40,
                                    width: MediaQuery.of(context).size.width,
                                    color: const Color(0xff585858),
                                    child: const Center(
                                        child: Text(
                                      "Choose Location",
                                      style: TextStyle(
                                          color: Colors.white,
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
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.blue,
                                            Color(0xff00C6FF)
                                          ],
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "CALCULATE",
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
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: tempColor.lightGreyColor,
                            style: BorderStyle.solid,
                            width: 1.5,
                          ),
                          color: tempColor.blackColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 4,
                              color: const Color(0xff585858),
                              child: const TextField(
                                maxLines: null, // Set this
                                expands: true, // and this
                                keyboardType: TextInputType.multiline,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Add Note',
                                  hintStyle: TextStyle(color: Colors.white),
                                  labelStyle: TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(
                                          0xff585858), // Change border color
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                NavigationService.instance
                                    .navigateTo(reviewBookingScreen);
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.blue, Color(0xff00C6FF)],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ]);
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

// BlocProvider(
//   create: (context) =>
//       ForgotPasswordCubit(context.read<AuthenticationRepository>()),
//   child: BlocListener<ForgotPasswordCubit, ForgotPasswordstate>(
//     listener: (context, state) {
//       if (state.status.isSubmissionFailure) {
//         ScaffoldMessenger.of(context)
//           ..hideCurrentSnackBar()
//           ..showSnackBar(SnackBar(
//             content: Text(
//               state.errorMessage ?? 'Invalid Email',
//             ),
//           ));
//       }
//       if (state.status.isSubmissionSuccess) {
//         ScaffoldMessenger.of(context)
//           ..hideCurrentSnackBar()
//           ..showSnackBar(SnackBar(
//             content: Text(
//               state.errorMessage ??
//                   'Your new password has sent to your email, Please check your email.',
//             ),
//           ));
//         NavigationService.instance.navigateTo(LoginRoute);
//       }
//     },
//           Stack(
//         children: [
//           //todo top background
//           Container(
//             width: MediaQuery.of(context).size.width,
//             height: 220,
//             child: Image.asset(
//               "lib/assets/icons/abput1.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             children: [
//               Container(
//                   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 100),
//                   child: LinearGradientWidget(
//                     firstText: 'Booking',
//                     lastText: 'From',
//                     fontSize: 30,
//                   )),
//             ],
//           ),
//           //todo email form

//           Padding(
//             padding: const EdgeInsets.only(top: 170.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(15.0),
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: tempColor.lightGreyColor,
//                         style: BorderStyle.solid,
//                         width: 1.5,
//                       ),
//                       color: tempColor.whiteColor,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Column(
//                       children: [
//                         const LinearGradientWidget(
//                           firstText: 'Confirm Your',
//                           lastText: 'Details',
//                           fontSize: 30,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "Thank you for selecting Speedylimo. Please verify your booking information, as we are committed to ensuring that your digital experience is as satisfying as possible. Thank you for choosing Speedylimo.",
//                           textAlign: TextAlign.center,
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         const Text(
//                           "WHEN IS YOUR TRIP?",
//                           style: TextStyle(color: Colors.blue),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   ), //time picker continer
//                   Container(
//                     margin: EdgeInsets.all(15.0),
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: tempColor.lightGreyColor,
//                         style: BorderStyle.solid,
//                         width: 1.5,
//                       ),
//                       color: tempColor.blackColor,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const LinearGradientWidget(
//                           firstText: ' ',
//                           lastText: 'PICKUP TIME:',
//                           fontSize: 20,
//                         ),
//                         Container(
//                           height: 40,
//                           width: 120,
//                           color: Color(0xff585858),
//                           child: const TimePickerWidget(
//                             fillColor: Color(0xff585858),
//                             textColor: Colors.white,
//                             borderColor: Color(0xff585858),
//                             size: 18,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ), //passenger count continer
//                   Container(
//                     margin: EdgeInsets.all(15.0),
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: tempColor.lightGreyColor,
//                         style: BorderStyle.solid,
//                         width: 1.5,
//                       ),
//                       color: tempColor.blackColor,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const LinearGradientWidget(
//                               firstText: ' ',
//                               lastText: '# of PASSENGERS',
//                               fontSize: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         count--;
//                                       });
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_left,
//                                       size: 35,
//                                       color: Colors.white,
//                                     )),
//                                 Text(
//                                   count.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 18),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         count++;
//                                       });
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_right,
//                                       size: 35,
//                                       color: Colors.white,
//                                     ))
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             const LinearGradientWidget(
//                               firstText: ' ',
//                               lastText: '# of BAGES',
//                               fontSize: 20,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         count1--;
//                                       });
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_left,
//                                       size: 35,
//                                       color: Colors.white,
//                                     )),
//                                 Text(
//                                   count1.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.white, fontSize: 18),
//                                 ),
//                                 IconButton(
//                                     onPressed: () {
//                                       setState(() {
//                                         count1++;
//                                       });
//                                     },
//                                     icon: const Icon(
//                                       Icons.arrow_right,
//                                       size: 35,
//                                       color: Colors.white,
//                                     ))
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ), //kindes of trips
//                   const LinearGradientWidget(
//                     lastText: "WHAT KIND OF TRIP IS THIS?",
//                     fontSize: 20,
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(15.0),
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: tempColor.lightGreyColor,
//                         style: BorderStyle.solid,
//                         width: 1.5,
//                       ),
//                       color: tempColor.blackColor,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               color = false;
//                               isChecked = true;
//                             });
//                           },
//                           child: Container(
//                             height: 50,
//                             width: MediaQuery.of(context).size.width,
//                             color: color == false
//                                 ? Colors.blue
//                                 : const Color(0xff585858),
//                             child: const Center(
//                               child: Text(
//                                 "POINT-TO-POINT",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 22),
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         InkWell(
//                           onTap: () {
//                             setState(() {
//                               color = true;
//                               isChecked = false;
//                             });
//                           },
//                           child: Container(
//                             height: 50,
//                             width: MediaQuery.of(context).size.width,
//                             color: color == true
//                                 ? Colors.blue
//                                 : const Color(0xff585858),
//                             child: const Center(
//                               child: Text(
//                                 "AS DIRECTED",
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 22),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ), //point to  point continer
//                   Container(
//                     child: isChecked == true
//                         ? Column(
//                             children: [
//                               Container(
//                                 margin: EdgeInsets.all(15.0),
//                                 padding: EdgeInsets.all(20),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: tempColor.lightGreyColor,
//                                     style: BorderStyle.solid,
//                                     width: 1.5,
//                                   ),
//                                   color: tempColor.blackColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const LinearGradientWidget(
//                                       firstText: ' ',
//                                       lastText: 'ENTER DROPOFF / TRIP DURATION',
//                                       fontSize: 20,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.all(15.0),
//                                 padding: EdgeInsets.all(20),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: tempColor.lightGreyColor,
//                                     style: BorderStyle.solid,
//                                     width: 1.5,
//                                   ),
//                                   color: tempColor.blackColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const LinearGradientWidget(
//                                       firstText: ' ',
//                                       lastText: 'ENTER DROPOFF:',
//                                       fontSize: 20,
//                                     ),
//                                     Container(
//                                       height: 40,
//                                       width: 120,
//                                       color: const Color(0xff585858),
//                                       child: const TimePickerWidget(
//                                         fillColor: Color(0xff585858),
//                                         textColor: Colors.white,
//                                         borderColor: Color(0xff585858),
//                                         size: 18,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.all(15.0),
//                                 padding: EdgeInsets.all(20),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: tempColor.lightGreyColor,
//                                     style: BorderStyle.solid,
//                                     width: 1.5,
//                                   ),
//                                   color: tempColor.blackColor,
//                                   borderRadius: BorderRadius.circular(5.0),
//                                 ),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const LinearGradientWidget(
//                                       firstText: ' ',
//                                       lastText: 'TRIP DURATION:',
//                                       fontSize: 20,
//                                     ),
//                                     Container(
//                                       height: 40,
//                                       width: 120,
//                                       color: const Color(0xff585858),
//                                       child: const TimePickerWidget(
//                                         fillColor: Color(0xff585858),
//                                         textColor: Colors.white,
//                                         borderColor: Color(0xff585858),
//                                         size: 18,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           )
//                         : null,
//                   ), //add stop
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       const LinearGradientWidget(
//                         lastText: "WHERE ARE YOU GOING?",
//                         fontSize: 22,
//                       ),
//                       Container(
//                         height: 30,
//                         width: 90,
//                         decoration: BoxDecoration(
//                           border: Border.all(
//                             color: tempColor.blackColor,
//                             style: BorderStyle.solid,
//                             width: 1.5,
//                           ),
//                         ),
//                         child: Center(
//                             child: TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "+ ADD STOP",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         )),
//                       )
//                     ],
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(15.0),
//                     padding: EdgeInsets.all(20),
//                     decoration: BoxDecoration(
//                       border: Border.all(
//                         color: tempColor.lightGreyColor,
//                         style: BorderStyle.solid,
//                         width: 1.5,
//                       ),
//                       color: tempColor.blackColor,
//                       borderRadius: BorderRadius.circular(5.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Container(
//                           height: 40,
//                           color: const Color(0xff585858),
//                           child: TextFormField(),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
