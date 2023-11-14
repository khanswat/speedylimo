import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    Key? key,
    this.controller,
    this.initialDate,
    this.hint = '',
    this.labelText = '',
    this.prefixIcon,
    this.fillColor,
    this.labelStyle,
  }) : super(key: key);

  final TextEditingController? controller;
  final DateTime? initialDate;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextStyle? labelStyle;
  final String hint;
  final String labelText;

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () async {
          _selectDate(context);
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color(0xffEFEFEF),
            border: Border.all(
              color: tempColor.lightGreyColor,
              // Border color for the outline
              width: 1.5, // Border width for the outline
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text("${selectedDate.toLocal()}".split(' ')[0]),
              const SizedBox(
                height: 20.0,
              ),
              const Icon(Icons.date_range),
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
