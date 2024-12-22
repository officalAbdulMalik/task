import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:startup_repo/helper/navigation.dart';
import 'package:startup_repo/utils/style.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distributes space
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 30,
              color: Theme.of(context).canvasColor,
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center, // Centers the title
              style: headlineSmall(context),
            ),
          ),
          30.horizontalSpace,
        ],
      ),
    );
  }
}
