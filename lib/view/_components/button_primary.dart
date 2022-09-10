// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/helpers/resourses.dart';

class ButtonPrimary extends StatefulWidget {
  final Function()? onPressed;
  final bool? loading;
  final String title;
  ButtonPrimary({
    Key? key,
    this.onPressed,
    this.loading,
    required this.title,
  }) : super(key: key);

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
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
            children: (widget.loading == true)
                ? [
                    Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ))
                  ]
                : [
                    Icon(Icons.check),
                    SizedBox(width: 5),
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
          ),
          style: ElevatedButton.styleFrom(primary: R.color.purplePrimary),
        ),
      ),
    );
  }
}
