import '../../../utils/constants/app/app_constants.dart';
import '/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key? key,
    this.controller,
    this.hint = '',
    this.labelText = '',
    this.hintStyle,
    this.icon,
    this.prefixIcon,
    this.fillColor,
    this.labelStyle,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.height = 40,
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
  final TextStyle? labelStyle;
  final String hint;
  final String labelText;
  final TextStyle? hintStyle;
  final TextInputType keyboardType;
  final bool obscureText;
  final double height;
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
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      onTap: onTap,
      key: key,
      controller: controller,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      maxLength: maxLength,
      obscureText: obscureText,
      obscuringCharacter: '*',
      textInputAction: textInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        filled: true,
        fillColor: fillColor,
        labelStyle: labelStyle,
        prefixIcon: prefixIcon,

        // filled: true,
        isDense: true,
        suffixIcon: icon,
        hintText: hint,
        labelText: labelText,
        hintStyle: hintStyle,
        //border: InputBorder.none,
        // errorStyle: const TextStyle(height: 0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: tempColor.blueColor),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: tempColor.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: tempColor.lightGreyColor),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.error,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      maxLines: maxLines,
      minLines: minLines,
      validator: validatation ? (_) => validator : (_) => null,
      inputFormatters: [
        inputFormatter ?? FilteringTextInputFormatter.deny(''),
      ],
      onSaved: onSaved,
      onChanged: onChanged,
    );
  }
}
