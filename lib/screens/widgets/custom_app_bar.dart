import 'package:demo_app/screens/constans/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(38.h); // ارتفاع الـ AppBar

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: preferredSize,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff366b02),
                Color(0xff366b02),
                Color(0xff366b02),
                Color(0xff1b8d1b),
                Color(0xff3b9f3b),
                Color(0xff4e9a4e),
                Color(0xffdece59),
                Color(0xffe3d98c),
                Color(0xffdac556),
                Color(0xffab950b),
                Color(0xffab950b),
                Color(0xffab950b),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
          ),
          child: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            // اجعلها شفافة لاستخدام التدرج
            elevation: 0,
            // إزالة الظل
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back, color: Colors.white),
            //   onPressed: () {
            //     Navigator.pop(context);
            //   },
            ),
            // title: ShaderMask(
            //     shaderCallback: (bounds) {
            //       return LinearGradient(
            //         tileMode: TileMode.mirror,
            //         begin: Alignment.centerLeft,
            //         end: Alignment.centerRight,
            //         colors: [
            //           Colors.transparent,
            //           Colors.white,
            //           Colors.white,
            //           Colors.transparent,
            //         ],
            //         stops: [0.0, 0.2, 0.8, 1.0], // تخصيص مدى الشفافية
            //       ).createShader(bounds);
            //     },
            //     blendMode: BlendMode.multiply,
            //     child: Image.asset(
            //       "assets/images/app_bar.png",
            //     ))),
          ),
        );
  }
}
