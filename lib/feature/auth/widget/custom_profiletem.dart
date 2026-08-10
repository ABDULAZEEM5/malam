import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomProfileitem extends StatelessWidget {
  final void Function()? onTap;
  final IconData icon;
  final String title;
  const CustomProfileitem({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      leading: Icon(icon, color: Appcolor.primaryColor, size: 26),
      title: CustomText(text: title, fontSize: 17, fontWeight: FontWeight.w500),
      trailing: const Icon(Icons.arrow_forward_ios, size: 15),
      onTap: onTap,
    );
    
  }
}
