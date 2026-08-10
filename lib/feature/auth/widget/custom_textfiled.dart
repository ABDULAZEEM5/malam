import 'package:flutter/material.dart';
import 'package:malam/core/constans/appcolor.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
     this.keyboardType,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFormField(
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        cursorColor: Appcolor.primaryColor,
        validator: (v) {
          if (v!.isEmpty) {
            return "${widget.labelText} لايمكن عن يكون فارغ";
          }

          return null;
        },
        textAlign: TextAlign.right,
        obscureText: widget.isPassword ? _obscureText : false,
        decoration: InputDecoration(
          filled: true,
          alignLabelWithHint: true,
          floatingLabelAlignment: FloatingLabelAlignment.start,
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Appcolor.primaryColor),
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Appcolor.primaryColor,
                  ),
                )
              : null,

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Appcolor.primaryColor, width: 1.5),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),

          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
