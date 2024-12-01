import 'package:demo_app/screens/home/home_screen.dart';
import 'package:demo_app/screens/auth_mobile/register_screen.dart';
import 'package:demo_app/screens/widgets/auth_field.dart';
import 'package:demo_app/screens/widgets/custom_app_bar.dart';
import 'package:demo_app/screens/widgets/custom_text_button.dart';
import 'package:demo_app/screens/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../api_sevices/auth_api_manger.dart';
import '../auth_web/login.dart';

class Login extends StatefulWidget {
  static const String routeName = "Login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var passController = TextEditingController();

  // لإظهار حالة تحميل أو خطأ
  bool isLoading = false;
  String? errorMessage;

  // الدالة المسؤولة عن تسجيل الدخول
  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      final response = await ApiManger.getInstance()
          .login(emailController.text, passController.text);

      if (response != null) {
        // تسجيل الدخول ناجح
        // يمكنك تنفيذ عملية التنقل إلى صفحة أخرى هنا
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم تسجيل الدخول بنجاح!")),
        );
      } else {
        // خطأ في تسجيل الدخول
        setState(() {
          errorMessage = "بيانات الدخول غير صحيحة. حاول مرة أخرى.";
        });
      }
    } catch (e) {
      // خطأ أثناء الاتصال بالخادم
      setState(() {
        errorMessage = "حدث خطأ أثناء الاتصال. الرجاء المحاولة لاحقًا.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.isDesktop) {
          return LoginWeb();
        }
        return Scaffold(
          appBar: CustomAppBar(),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    "أهلًا بك! استعد لتجربة مميزة معنا",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 4.sp, fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 10),
                Form(
                  child: Column(
                    children: [
                      AuthField(
                        tittle: " ادخل بريدك الالكتروني",
                        controller: emailController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "الرجاء إدخال البريد الإلكتروني.";
                          }
                          return null;
                        },
                        onChanged: (text) {},
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 30),
                      AuthField(
                        tittle: " ادخل الرقم السري",
                        controller: passController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return "الرجاء إدخال كلمة المرور.";
                          }
                          return null;
                        },
                        onChanged: (text) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 35),
                if (errorMessage != null)
                  Center(
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 16.sp),
                    ),
                  ),
                Center(
                  child: isLoading
                      ? CircularProgressIndicator() // مؤشر التحميل أثناء تسجيل الدخول
                      : PrimaryButton(
                          width: 250.w,
                          onTap: loginUser,
                          // استدعاء الدالة
                          text: "ابدأ التسجيل",
                          borderRadius: 18.r,
                          color: Colors.green,
                          textColor: Colors.white,
                          fontSize: 5.sp,
                        ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height / 80),
                CustomTextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(RegisterScreen.routeName);
                  },
                  text: "ليس لدي حساب",
                  fontSize: 5.sp,
                  color: Colors.blue,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
