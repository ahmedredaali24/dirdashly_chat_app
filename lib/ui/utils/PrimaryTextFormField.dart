import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class PrimaryTextFormField extends StatelessWidget {
  final double? borderRadius;
  final Color? fillColor;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
 final Function(PointerDownEvent)? onTapOutside;
  final double width, height;
  final TextEditingController controller;
  final Color? hintTextColor, prefixIconColor;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  PrimaryTextFormField(
      {super.key,
      required this.hintText,
      this.keyboardType,
      required this.controller,
      required this.width,
      required this.height,
      this.hintTextColor,
      this.fillColor,
      this.onTapOutside,
      this.prefixIcon,
      this.prefixIconColor,
      this.inputFormatters,
      this.borderRadius = 8,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      keyboardType: keyboardType,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.kGreyColor,
      ),
      decoration: InputDecoration(
          fillColor: fillColor ?? AppColors.kLightAccentColor,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: hintTextColor ?? AppColors.kGreyColor,
          ),
          prefixIcon: prefixIcon,
          prefixIconColor: prefixIconColor,
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.white),
              borderRadius: BorderRadius.circular(8)),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 3, color: Colors.white),
            borderRadius: BorderRadius.circular(8),
          )),
      inputFormatters: inputFormatters,
      onTapOutside: onTapOutside,
    );
  }
}

