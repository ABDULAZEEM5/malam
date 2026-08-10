import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomProfileimage extends StatelessWidget {
  final ImageProvider<Object> backgroundImage;
  final void Function()? onPressed;
  const CustomProfileimage({
    super.key,
    required this.backgroundImage,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Appcolor.primaryColor,
          ),
          child: CircleAvatar(radius: 60, backgroundImage: backgroundImage),
        ),
        Positioned(
          right: -7,
          left: 90,
          bottom: 4,
          child: Container(
            decoration: BoxDecoration(
              color: Appcolor.primaryColor,
              border: Border.all(width: 2, color: Appcolor.greywhiteColor),
              shape: BoxShape.circle,
            ),

            child: IconButton(
              iconSize: 25,
              onPressed: onPressed,
              icon: Icon(Icons.camera_alt, color: Appcolor.backgroundColor),
            ),
          ),
        ),
      ],
    );
  }
}
