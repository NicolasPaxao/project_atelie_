import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  SearchTextField({Key? key}) : super(key: key);

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: TextFormField(
          cursorColor: Colors.white,
          decoration: InputDecoration(
              fillColor: Colors.grey.withOpacity(0.4),
              filled: true,
              hintStyle: TextStyle(color: Colors.white),
              hintText: 'Pesquise um produto...',
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.white,
                ),
              ),
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ))),
        ),
      ),
    );
  }
}
