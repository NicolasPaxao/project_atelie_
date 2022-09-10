// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/helpers/resourses.dart';

class ButtonSecondary extends StatefulWidget {
  final Function()? onPressed;
  final String title;
  ButtonSecondary({
    Key? key,
    this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  State<ButtonSecondary> createState() => _ButtonSecondaryState();
}

class _ButtonSecondaryState extends State<ButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        child: ElevatedButton(
          onPressed: widget.onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    color: R.color.purplePrimary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              side: BorderSide(width: 1, color: R.color.purplePrimary)),
        ),
      ),
    );
  }
}
