import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final int? maxLines;
  const CustomText({
    super.key,
    required this.text,
    this.color,
    required this.fontSize,
    required this.fontWeight,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines ?? 1,
      overflow: TextOverflow.ellipsis,
      textDirection: TextDirection.rtl,
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color ?? Appcolor.primaryColor,
      ),
    );
  }
}
