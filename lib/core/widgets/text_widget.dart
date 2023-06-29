import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {super.key,
      required this.text,
      this.color,
      this.enableCenter = false,
      this.maxLine,
      this.fontSize,
      this.fontWeight});
  final String text;
  final Color? color;
  final bool enableCenter;
  final int? maxLine;
  final FontWeight? fontWeight;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLine,
      textAlign: enableCenter ? TextAlign.center : null,
      style: TextStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: color ?? Colors.black,
      ),
    );
  }
}
