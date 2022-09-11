import 'package:atelie/core/helpers/resourses.dart';
import 'package:flutter/material.dart';

class UtilsButton extends StatefulWidget {
  final String title;
  final IconData image;
  final dynamic onTap;

  const UtilsButton(
      {super.key, required this.title, required this.image, this.onTap});

  @override
  State<UtilsButton> createState() => _UtilsButtonState();
}

class _UtilsButtonState extends State<UtilsButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 168,
        height: 139,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                widget.image,
                color: Colors.black,
                size: 59,
              ),
              SizedBox(height: 9),
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ));
  }
}
