import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomBottomicon extends StatelessWidget {
  final IconData icon;
  final double? right;
  final double? top;
  final double? bottom;
  final void Function()? onPressed;
  const CustomBottomicon({
    super.key,
    this.right,
    this.top,
    this.bottom,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      right: right,
      top: top,
      child: Container(
        height: 40,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Appcolor.primaryColor.withValues(alpha: .45),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(icon, size: 26),
          color: Appcolor.backgroundColor,
        ),
      ),
    );
  }
}
