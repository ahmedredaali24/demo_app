import 'package:bloc/bloc.dart';
import 'package:demo_app/screens/constans/thems.dart';
import 'package:demo_app/screens/home/home_screen.dart';
import 'package:demo_app/screens/auth_mobile/login.dart';
import 'package:demo_app/screens/auth_mobile/register_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'my_bloc_observe.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            locale: DevicePreview.locale(context),
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: AppTheme.myTheme,
            darkTheme: ThemeData.dark(),
            initialRoute: Login.routeName,
            routes: {
              HomeScreen.routeName: (context) => HomeScreen(),
              Login.routeName: (context) => Login(),
              RegisterScreen.routeName: (context) => RegisterScreen()
            },
          );
        });
  }
}
