import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget(
      {Key? key,
      this.controller,
      this.initialDate,
      this.hint = '',
      this.labelText = '',
      this.prefixIcon,
      this.fillColor,
      this.labelStyle,
      required this.onTap,
      required this.selectDate})
      : super(key: key);

  final TextEditingController? controller;
  final DateTime? initialDate;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final String hint;
  final String labelText;
  final String selectDate;
  final VoidCallback onTap;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffEFEFEF),
            border: Border.all(
              color: tempColor.lightGreyColor,
              // Border color for the outline
              width: 1.5, // Border width for the outline
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(widget.selectDate),
                widget.selectDate != ''
                    ? SizedBox(
                        width: 10.0,
                      )
                    : Container(),
                const Icon(Icons.calendar_month),
                // ElevatedButton(
                //   onPressed: () => _selectDate(context),
                //   child: const Text('Select date'),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
