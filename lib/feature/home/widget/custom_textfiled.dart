import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomTextfiled extends StatelessWidget {
  final TextEditingController? controller;
  const CustomTextfiled({super.key, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      child: TextField(
        controller: controller,
        cursorHeight: 25,
        textAlign: TextAlign.right,
        cursorColor: Appcolor.primaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          hint: CustomText(
            text: "ابحث عن خدمة ",
            fontSize: 16,
            fontWeight: FontWeight.normal,
          ),
          filled: true,
          suffixIcon: Icon(Icons.search_outlined),
          fillColor: Appcolor.greywhiteColor,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Appcolor.primaryColor, width: 1.4),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
