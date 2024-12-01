import 'package:demo_app/screens/auth_mobile/login.dart';
import 'package:demo_app/screens/utils/dialog_utils.dart';
import 'package:demo_app/screens/widgets/auth_field.dart';
import 'package:demo_app/screens/widgets/custom_app_bar.dart';
import 'package:demo_app/screens/widgets/custom_text_button.dart';
import 'package:demo_app/screens/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var userName = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(12.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  "أهلًا بك! استعد لتجربة مميزة معنا",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 4.sp, fontWeight: FontWeight.w800),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
              ),
              Form(
                  child: Column(
                children: [
                  AuthField(
                    tittle: " ادخل بريدك الالكتروني",
                    controller: email,
                    validator: (val) {},
                    onChanged: (text) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  AuthField(
                    tittle: " ادخل رقم الهاتف",
                    controller: email,
                    validator: (val) {},
                    onChanged: (text) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  AuthField(
                    tittle: " ادخل الرقم السري",
                    controller: email,
                    validator: (val) {},
                    onChanged: (text) {},
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 30,
                  ),
                  AuthField(
                    tittle: " تاكيد الرقم السري",
                    controller: email,
                    validator: (val) {},
                    onChanged: (text) {},
                  ),
                ],
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 35,
              ),
              Center(
                child: PrimaryButton(
                  width: 250.w,
                  onTap: () async {
                    DialogUtils.showLoading(
                        context: context, massage: "loading");
                    await Future.delayed(Duration(seconds: 2));
                    DialogUtils.hideLoading(context);
                    DialogUtils.showMessage(
                        context: context,
                        title: "تم انشاء الحساب",
                        massage: "تم انشاء الحساب",
                        posAction: () {
                          try {
                            Navigator.of(context)
                                .pushReplacementNamed(Login.routeName);
                          } catch (e) {}
                        },
                        posActionName: "ok");
                  },
                  text: "ابد التسجيل",
                  borderRadius: 10.r,
                  color: Colors.green,
                  textColor: Colors.white,
                  fontSize: 5.sp,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 80,
              ),
              CustomTextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(Login.routeName);
                },
                text: "لدي حساب بالفعل",
                fontSize: 5.sp,
                color: Colors.blue,
              ),
            ],
          ),
        ));
  }
}
