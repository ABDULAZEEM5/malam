import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/feature/messages/widget/custom_messagetextfiled.dart';

class CustomBottomsend extends StatelessWidget {
  final Color? color;
  final TextEditingController controller;
  final Function(String)? onChanged;
  final void Function()? onPressed;
  const CustomBottomsend({
    super.key,
    this.color,
    required this.controller,
    this.onChanged,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Appcolor.backgroundColor,
      margin: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 290,
            child: CustomMessageTextfiled(
              controller: controller,
              onChanged: onChanged,
            ),
          ),
          IconButton(
            color: controller.text.isEmpty
                ? Appcolor.greyColor
                : Appcolor.secondaryColor,
            iconSize: 40,
            onPressed: onPressed,
            icon: Icon(Icons.send_sharp),
          ),
        ],
      ),
    );
  }
}
