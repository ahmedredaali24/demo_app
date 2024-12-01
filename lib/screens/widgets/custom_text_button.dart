import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        overflow: TextOverflow.ellipsis,
        text,
        style: TextStyle(
            color: color ?? const Color(0xFF329494),
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
