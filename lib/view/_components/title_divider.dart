import 'package:flutter/material.dart';

class TitleDivider extends StatelessWidget {
  final Widget child;

  const TitleDivider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
        child: child);
  }
}
