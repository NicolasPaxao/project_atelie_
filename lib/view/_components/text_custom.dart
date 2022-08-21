import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  final String title;
  final double fontS;
  final bool isBold;
  final Color? color;
  const TextCustom(
      {Key? key,
      required this.title,
      required this.fontS,
      required this.isBold,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontS,
        fontWeight: isBold ? FontWeight.bold : FontWeight.w400,
        color: color ?? Colors.black,
      ),
    );
  }
}
