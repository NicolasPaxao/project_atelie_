import 'package:atelie/view/view.dart';
import 'package:flutter/material.dart';

import '../../core/helpers/resourses.dart';

class EditField extends StatefulWidget {
  final void Function() onTap;
  final String title;
  final String text;
  EditField(
      {Key? key, required this.onTap, required this.title, required this.text})
      : super(key: key);

  @override
  State<EditField> createState() => _EditFieldState();
}

class _EditFieldState extends State<EditField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Colors.black38))),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Row(
              children: [
                Expanded(
                  child: TextCustom(
                    title: widget.title,
                    fontS: 16,
                    isBold: true,
                  ),
                ),
                Expanded(
                  child: TextCustom(
                    title: widget.text,
                    fontS: 14,
                    isBold: false,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: IconButton(
            onPressed: () {
              widget.onTap();
            },
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
            icon: Icon(
              Icons.edit,
              color: R.color.purplePrimary,
              size: 24,
            ),
          ))
        ],
      ),
    );
  }
}
