import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';
import 'package:malam/sheard/custom_text.dart';

class CustomDropdownfield extends StatelessWidget {
  final void Function(String? value)? onChanged;
  final List items;
  final String title;
  final String hint;
  const CustomDropdownfield({
    super.key,
    this.onChanged,
    required this.items,
    required this.title,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      iconEnabledColor: Appcolor.primaryColor,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolor.secondaryColor),
          borderRadius: BorderRadius.circular(10),
        ),

        label: CustomText(
          text: title,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Appcolor.secondaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      hint:  Text(hint),
      items: items
          .map(
            (service) => DropdownMenuItem<String>(
              value: service,
              child: CustomText(
                text: service,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}
