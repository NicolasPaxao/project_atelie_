// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:atelie/helpers/resourses.dart';
import 'package:flutter/material.dart';

class InputTextCustom extends StatefulWidget {
  final bool? obscureText;
  final String labelText;
  final dynamic validator;
  final Icon? prefix;
  final Widget? suffix;
  final TextEditingController controller;
  final TextInputType? keyboard;
  final dynamic onChaged;
  const InputTextCustom({
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
  State<InputTextCustom> createState() => _InputTextCustomState();
}

class _InputTextCustomState extends State<InputTextCustom> {
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
          hintText: widget.labelText,
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
