import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';

class TimePickerWidget extends StatefulWidget {
  const TimePickerWidget({
    Key? key,
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
  }) : super(key: key);

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

  @override
  State<TimePickerWidget> createState() => _TimePickerWidgetState();
}

class _TimePickerWidgetState extends State<TimePickerWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          _selectTime(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.fillColor,
            border: Border.all(
              color: widget.borderColor!,
              // Border color for the outline
              width: 1.5, // Border width for the outline
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                selectedTime.format(context),
                style:
                    TextStyle(color: widget.textColor, fontSize: widget.size),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Icon(Icons.access_time),
              // ElevatedButton(
              //   onPressed: () => _selectDate(context),
              //   child: const Text('Select date'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
