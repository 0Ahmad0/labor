import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppSelectYourLocation extends StatelessWidget {
  const AppSelectYourLocation({
    super.key,
    required this.subTitle,
    this.onTap,
  });

  final String subTitle;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: AppPadding.p16.sp,
        ),
        decoration: BoxDecoration(
          color: AppColors.darkGreen,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 28.sp,
            backgroundColor: AppColors.white,
            child: Icon(
              Icons.location_on_rounded,
              color: AppColors.yellow,
            ),
          ),
          title: Text(
            tr(LocaleKeys.home_your_location),
            style: getMediumStyle(fontSize: 12.sp, color: AppColors.white),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: AppPadding.p8.sp),
            child: Text(
              subTitle,
              overflow: TextOverflow.ellipsis,
              style: getBoldStyle(
                fontSize: 14.sp,
                color: AppColors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
