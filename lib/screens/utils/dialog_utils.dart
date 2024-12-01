import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/app_colors.dart';

class DialogUtils {
  static void showLoading(
      {required BuildContext context,
      required String massage,
      bool isDismissible = false}) {
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [
                const CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .015,
                ),
                Text(
                  massage,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 3.sp,
                      fontWeight: FontWeight.w300),
                )
              ],
            ),
          );
        });
  }

  static void hideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void showMessage(
      {required BuildContext context,
      bool isDismissible = false,
      required String massage,
      String? title,
      String? posActionName,
      required Function posAction,
      String? nagActionName,
      Function? nagAction}) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              if (posAction != null) {}
              // posAction?.call();
            },
            child: Text(
              overflow: TextOverflow.ellipsis,
              posActionName,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 4.sp,
                  fontWeight: FontWeight.w300),
            )),
      );
    }
    if (nagActionName != null) {
      actions.add(
        TextButton(
            onPressed: () {
              Navigator.pop(context);
              // if(nagAction!=null){
              //    nagAction.call();
              // }
              nagAction?.call();
            },
            child: Text(
              overflow: TextOverflow.ellipsis,
              nagActionName,
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 4.sp,
                  fontWeight: FontWeight.w300),
            )),
      );
    }
    showDialog(
        barrierDismissible: isDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              massage,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 3.sp,
                  fontWeight: FontWeight.w300),
            ),
            title: Text(
              overflow: TextOverflow.ellipsis,
              title ?? "",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 5.sp,
                  fontWeight: FontWeight.w300),
            ),
            actions: actions,
          );
        });
  }
}
