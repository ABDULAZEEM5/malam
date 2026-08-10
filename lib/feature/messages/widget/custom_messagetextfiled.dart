import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';


class CustomMessageTextfiled extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomMessageTextfiled({
    super.key,
    required this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      cursorColor: Appcolor.primaryColor,
      controller: controller,
      textAlign: TextAlign.right,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(10),
        filled: true,
        fillColor: Appcolor.greywhiteColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          // borderSide: BorderSide(color: Appcolor.primaryColor, width: 1.3),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          // borderSide: BorderSide(color: Appcolor.primaryColor),
        ),
      ),
    );
  }
}
