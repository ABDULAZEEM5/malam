import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomButtomTec extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomButtomTec({
    super.key,
    required this.text,
    this.onPressed,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 120,
      height: height ?? 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:backgroundColor?? Appcolor.secondaryColor,
          foregroundColor:foregroundColor?? Appcolor.primaryColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Appcolor.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: CustomText(
          text: text,
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Appcolor.primaryColor,
        ),
      ),
    );
  }
}
