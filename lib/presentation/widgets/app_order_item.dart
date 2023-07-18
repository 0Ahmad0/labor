import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppOrderItem extends StatelessWidget {
  const AppOrderItem({
    super.key,
    required this.title,
    this.subTitle,
    this.child,
  });

  final String title;
  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
      dense: true,
      isThreeLine: true,
      contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
      title: Text(
        title,
        style: getMediumStyle(fontSize: 12.sp, color: AppColors.greyText),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: AppPadding.p8.sp),
        child: subTitle == null
            ? child
            : Text(
                subTitle!,
                style: getMediumStyle(fontSize: 14.sp, color: AppColors.black),
              ),
      ),
    ));
  }
}
