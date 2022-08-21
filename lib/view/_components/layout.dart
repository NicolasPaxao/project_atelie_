import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/resourses.dart';

class LayoutCustom extends StatefulWidget {
  final String title;
  final Widget body;
  final FloatingActionButton? floatButton;
  final PreferredSizeWidget? appBarBottom;
  final List<Widget>? actions;

  const LayoutCustom({
    super.key,
    required this.title,
    required this.body,
    this.floatButton,
    this.appBarBottom,
    this.actions,
  });

  @override
  State<LayoutCustom> createState() => _LayoutCustomState();
}

class _LayoutCustomState extends State<LayoutCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: R.color.purplePrimary,
        toolbarHeight: 100,
        title: Text(widget.title),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        bottom: widget.appBarBottom,
        actions: widget.actions,
      ),
      body: widget.body,
      floatingActionButton: widget.floatButton,
    );
  }
}
