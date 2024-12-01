import 'package:demo_app/screens/widgets/primary_continer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String tittle;

  const AuthField({
    required this.controller,
    this.onChanged,
    this.validator,
    super.key,
    required this.tittle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          overflow: TextOverflow.ellipsis,
          tittle,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 5.sp),
          textAlign: TextAlign.right,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 50,
        ),
        PrimaryContainer(
          // height: 16.h,
          // width: 20.w,
          child: TextFormField(
            controller: controller,
            onChanged: onChanged,
            validator: validator,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 9.w,
                vertical: 16.h,
              ),
              // filled: true,
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r)),
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50.r)),
            ),
          ),
        ),
      ],
    );
  }
}
