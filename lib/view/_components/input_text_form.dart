import 'package:flutter/material.dart';

import '../../core/helpers/resourses.dart';

class InputTextCustomForm extends StatefulWidget {
  final bool? obscureText;
  final String labelText;
  final dynamic validator;
  final Icon? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final TextInputType? keyboard;
  final dynamic onChaged;
  const InputTextCustomForm({
    Key? key,
    this.obscureText,
    required this.labelText,
    required this.validator,
    this.prefix,
    this.suffix,
    required this.controller,
    this.keyboard,
    required this.onChaged,
  }) : super(key: key);

  @override
  State<InputTextCustomForm> createState() => _InputTextCustomFormState();
}

class _InputTextCustomFormState extends State<InputTextCustomForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        cursorColor: R.color.purplePrimary,
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
          fillColor: R.color.purplePrimary,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: R.color.purplePrimary),
          iconColor: R.color.purplePrimary,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: R.color.purplePrimary, width: 2)),
          prefixIcon: widget.prefix ?? null,
          suffixIcon: widget.suffix ?? null,
        ),
        keyboardType: widget.keyboard ?? null,
        validator: widget.validator ?? null,
        onChanged: widget.onChaged,
      ),
    );
  }
}
