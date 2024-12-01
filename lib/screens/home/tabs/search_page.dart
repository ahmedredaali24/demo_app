import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return
       SingleChildScrollView(
         child: Padding(
          padding: EdgeInsets.all(15.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Not Ready ",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontSize: 20.sp, color: Colors.grey),
              ),
              Center(child: Image.asset("assets/images/search.png")),
            ],
          ),
         
             ),
       );
  }
}
