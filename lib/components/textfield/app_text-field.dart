import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    super.key,
    required this.controller,
    this.onChanged,
    Color? bgColor,
    this.hintText,
    this.hintColor = Colors.grey,
    BorderRadiusGeometry? borderRadius,
    required this.textInputAction,
    EdgeInsetsGeometry? padding,
  })  : bgColor = bgColor ??
            Colors.grey.withOpacity(0.36), // constructor khong phai const,
        borderRadius = borderRadius ?? BorderRadius.circular(10.0),
        padding = padding ??
            const EdgeInsets.symmetric(vertical: 2.0)
                .copyWith(left: 16.0, right: 4.0);

  final TextEditingController controller;
  final Function(String)? onChanged;
  final Color bgColor;
  final String? hintText;
  final Color hintColor;
  final BorderRadiusGeometry borderRadius;
  final EdgeInsetsGeometry padding;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: bgColor, borderRadius: borderRadius),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
