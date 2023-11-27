import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class BookingQueriesWidget extends StatelessWidget {
  const BookingQueriesWidget({
    Key? key,
    this.image,
    this.name = '',
    this.EmailAddress = '',
    this.PhoneNo = '',
    this.dateTime = '',
    this.fontSize,
    this.onPressed,
    this.onDelete,
  }) : super(key: key);

  final String name;
  final String EmailAddress;
  final String PhoneNo;
  final String dateTime;
  final Widget? image;
  final double? fontSize;
  final VoidCallback? onPressed;
  final VoidCallback? onDelete;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          GestureDetector(
            onTap: onPressed,
            child: Container(
                margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tempColor.lightGreyColor,
                    style: BorderStyle.solid,
                    width: 1.5,
                  ),
                  color: tempColor.whiteColor,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Name:  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 15),
                              ),
                              Text(
                                name,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.remove_red_eye_outlined,
                            color: Colors.blue,
                            size: 30,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email Address:   ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Text(
                            EmailAddress,
                            style: TextStyle(
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
                            'Phone No:  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Text(
                            PhoneNo,
                            style: TextStyle(
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
                            'Date / Time:  ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15),
                          ),
                          Text(
                            dateTime,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
          ),
          // Container(
          //     margin: const EdgeInsets.all(15.0),
          //     padding: const EdgeInsets.all(10),
          //     decoration: BoxDecoration(
          //       border: Border.all(
          //         color: tempColor.lightGreyColor,
          //         style: BorderStyle.solid,
          //         width: 1.5,
          //       ),
          //       color: tempColor.whiteColor,
          //       borderRadius: BorderRadius.circular(5.0),
          //     ),
          //     child: Column(
          //       children: [
          //         Container(
          //           height: 160,
          //           width: MediaQuery.of(context).size.width,
          //           child: ClipRRect(
          //               borderRadius: BorderRadius.circular(9.0), child: image),
          //         ),
          //         const SizedBox(
          //           width: 15,
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          //         Text(
          //           text,
          //           style: TextStyle(color: Colors.black, fontSize: 16),
          //         ),
          //         SizedBox(
          //           height: 10,
          //         ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Container(
          //       width: 100,
          //       decoration: BoxDecoration(
          //         border: Border.all(
          //           color: tempColor.lightGreyColor,
          //           style: BorderStyle.solid,
          //           width: 1.5,
          //         ),
          //         color: Colors.blue,
          //         borderRadius: BorderRadius.circular(5.0),
          //       ),
          //       child: Center(
          //         child: Text(
          //           "Published",
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 16),
          //         ),
          //       ),
          //     ),
          //             Row(
          //               children: [
          //                 GestureDetector(
          //                   onTap: onPressed,
          //                   child: CircleAvatar(
          //                     radius: 22.0,
          //                     backgroundColor: Colors.blue,
          //                     child: Icon(
          //                       Icons.edit,
          //                       color: Colors.white,
          //                       size: 23,
          //                     ),
          //                   ),
          //                 ),
          //                 SizedBox(
          //                   width: 10,
          //                 ),
          //                 GestureDetector(
          //                   onTap: onDelete,
          //                   child: CircleAvatar(
          //                     radius: 22.0,
          //                     backgroundColor: Colors.red,
          //                     child: Icon(
          //                       Icons.delete,
          //                       color: Colors.white,
          //                       size: 23,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       ],
          //     )),
        ],
      ),
    );
  }
}
