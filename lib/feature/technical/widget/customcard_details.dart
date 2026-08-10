import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomcardDetails extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final IconData? icon;
 final bool isicon;
  const CustomcardDetails({
    super.key,
    required this.text,
    this.height,
    this.width, this.icon, 
    required this.isicon,
  });

  @override
  Widget build(BuildContext context) {
    return 
      
        Container(
          alignment: Alignment.center,
          height: height ?? 40,
          width: width ?? 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Appcolor.primaryColor.withValues(alpha: .20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: text,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
           isicon ? Icon(icon): SizedBox.shrink()
            ],
          ),
       
    );
  }
}
