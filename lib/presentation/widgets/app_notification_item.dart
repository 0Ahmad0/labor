import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_constants.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_colors.dart';
import '../resources/app_routes.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppNotificationItem extends StatelessWidget {
  const AppNotificationItem(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.notificationType = NotificationType.reminder,
      required this.time})
      : super(key: key);
  final String icon;
  final String title;
  final String time;
  final String subTitle;
  final NotificationType notificationType;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppMargin.m14.sp),
      padding: EdgeInsets.all(AppPadding.p18.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14.sp),
          border: Border.all(
            color: AppColors.greyText,
            width: .5.sp,
          )),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: EdgeInsets.all(AppPadding.p12.sp),
              width: 64.sp,
              height: 64.sp,
              decoration: BoxDecoration(
                color: AppColors.greyText.withOpacity(.05),
                borderRadius: BorderRadius.circular(14.r),
              ),
              child: SvgPicture.asset(icon),
            ),
            contentPadding: EdgeInsets.zero,
            title: Text(
              title,
              style: getSemiBoldStyle(
                fontSize: 14.sp,
              ),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: AppPadding.p8.sp),
              child: Text(
                subTitle,
                style:
                    getMediumStyle(fontSize: 14.sp, color: AppColors.greyText),
              ),
            ),
            trailing: Column(
              children: [
                FittedBox(
                  child: Text(
                    time,
                    style: getMediumStyle(
                        fontSize: 12.sp, color: AppColors.greyText),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s8.sp,
          ),
          Visibility(
            visible: notificationType == NotificationType.confirmed,
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, Routes.addCard);
              },
              child: Column(
                children: [
                  const Divider(
                    height: 0,
                  ),
                  SizedBox(
                    height: AppSize.s4.sp,
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      tr(LocaleKeys.notification_payment_methods),
                      style: getSemiBoldStyle(
                          fontSize: 16.sp, color: AppColors.primary),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.primary,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
