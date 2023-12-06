import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:speedylimo/utils/utils.dart';

import '../../../utils/constants/app/app_constants.dart';

// ignore: must_be_immutable
class TimePickerWidget extends StatefulWidget {
  TimePickerWidget(
      {Key? key,
      this.controller,
      this.borderColor,
      this.hint = '',
      this.selectedTime,
      this.labelText = '',
      this.textColor,
      this.hintStyle,
      this.icon,
      this.prefixIcon,
      this.fillColor,
      this.labelStyle,
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.size = 40,
      this.width,
      this.validatation = true,
      this.errorText = 'This field can not be empty',
      this.inputFormatter,
      this.maxLines = 1,
      this.minLines = 1,
      this.maxLength,
      this.textInputAction = TextInputAction.done,
      this.withLabel = true,
      this.validator,
      this.onSaved,
      this.onChanged,
      this.onTap,
      this.enable = true,
      required this.selecTime,
      required this.onSelected})
      : super(key: key);

  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TimeOfDay? selectedTime;
  final Color? textColor;
  final Color? borderColor;
  final TextStyle? labelStyle;
  final String hint;
  final String labelText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final bool obscureText;
  final double size;
  final double? width;
  final bool validatation;
  final String errorText;
  final FilteringTextInputFormatter? inputFormatter;
  final int maxLines;
  final int minLines;
  final int? maxLength;
  final TextInputAction textInputAction;
  final bool withLabel;
  final String? validator;
  final Function(String? value)? onSaved;
  final Function(String? value)? onChanged;
  final VoidCallback? onTap;
  final bool enable;
  var selecTime;
  final VoidCallback onSelected;

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  // Future<void> _selectTime(BuildContext context) async {
  //   final TimeOfDay? picked = await showTimePicker(
  //     context: context,
  //     initialTime: selectedTime,
  //   );
  //   if (picked != null && picked != selectedTime) {
  //     setState(() {
  //       selectedTime = picked;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: widget.onSelected,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color(0xffEFEFEF),
            border: Border.all(
              color: tempColor.lightGreyColor,
              // Border color for the outline
              width: 1.5, // Border width for the outline
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  widget.selecTime,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                const Icon(
                  Icons.access_time,
                  size: 20,
                ),
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
