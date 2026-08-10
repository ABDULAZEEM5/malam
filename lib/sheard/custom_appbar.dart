import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomAppbar extends StatelessWidget {
  final String text;
  final void Function()? onPressednotif;

  const CustomAppbar({super.key, required this.text, this.onPressednotif});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.menu, size: 33)),
          Spacer(),
          CustomText(text: text, fontSize: 15, fontWeight: FontWeight.bold),
          Icon(Icons.location_on, color: Appcolor.secondaryColor),
          Spacer(),
          IconButton(
            onPressed: onPressednotif,
            icon: Icon(Icons.notifications_outlined, size: 33),
          ),
        ],
      ),
    );
  }
}
