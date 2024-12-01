import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constans/app_colors.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTapFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(1.r),
      topRight: Radius.circular(1.r),
    ),
    child: BottomNavigationBar(
      selectedLabelStyle: TextStyle(color: Colors.grey),
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.whiteColor,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      currentIndex: selectedIndex,
      onTap: onTapFunction,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      items: [
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: selectedIndex == 0
                    ? AppColors.blueColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Icon(
                Icons.home_outlined,
                size: 20.r,
              ),
            ),
            label: "HOME"),
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: selectedIndex == 1
                    ? AppColors.blueColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Icon(
                Icons.search,
                size: 20.r,
              ),
            ),
            label: "Search"),
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: selectedIndex == 2
                    ? AppColors.blueColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Icon(
                Icons.chat_bubble_outline_outlined,
                size: 20.r,
              ),
            ),
            label: "Message"),
        BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(
                color: selectedIndex == 3
                    ? AppColors.blueColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(5.r),
              ),
              child: Icon(
                Icons.menu,
                size: 20.r,
              ),
            ),
            label: "Setting")
      ],
    ),
  );
}
