import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomOrderTextfiled extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final int? maxLines;
  final int? maxLength;
  const CustomOrderTextfiled({
    super.key,
    required this.controller,
    this.maxLines,
    this.maxLength,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) {
        if (v!.isEmpty) {
          return "$hinttext لايمكن عن يكون فارغ";
        }
        return null;
      },
      cursorColor: Appcolor.primaryColor,
      controller: controller,
      maxLines: maxLines ?? 6,
      maxLength: maxLength ?? 250,
      decoration: InputDecoration(
        hint: CustomText(
          text: hinttext,
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        filled: true,
        fillColor: Appcolor.backgroundColor,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Appcolor.primaryColor, width: 1.3),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Appcolor.primaryColor),
        ),
      ),
    );
  }
}
