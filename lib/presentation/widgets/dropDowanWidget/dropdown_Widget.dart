import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  const DropDownWidget({
    Key? key,
    required this.list,
    required this.onChange,
    required this.dvaluel,
    this.boderColor,
  }) : super(key: key);

  final List<String> list;
  final ValueChanged<String?> onChange;
  final String dvaluel;
  final Color? boderColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownButton<String>(
          isExpanded: true,
          iconEnabledColor: Colors.black,
          items: list
              .map((e) => DropdownMenuItem<String>(
                    // ignore: sort_child_properties_last
                    child: Text(
                      e,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    value: e,
                  ))
              .toList(),
          value: dvaluel,
          onChanged: onChange,
        ),
      ),
    );
  }
}
