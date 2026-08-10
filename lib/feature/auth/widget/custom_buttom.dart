import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomButtom extends StatelessWidget {
  final Function()? onTap;
  final String text;
  
  const CustomButtom({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 55,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Appcolor.primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Appcolor.backgroundColor,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
    );
  }
}
