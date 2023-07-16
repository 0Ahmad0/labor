import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppProfileItem extends StatelessWidget {
  const AppProfileItem({
    super.key,
    required this.icon,
    required this.title,
    this.subTitle,
    this.trailing,
    required this.goToRoute,
  });

  final String icon;
  final String title;
  final String? subTitle;
  final Widget? trailing;
  final String goToRoute;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppMargin.m20.sp),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: ListTile(
        onTap: goToRoute.isEmpty
            ? null
            : () {
                Navigator.pushNamed(context, goToRoute);
              },
        trailing: trailing ??
            Icon(
              Icons.arrow_forward_ios,
              size: AppSize.s20.sp,
              color: AppColors.black,
            ),
        leading: Padding(
          padding: EdgeInsets.all(AppPadding.p8.sp),
          child: SvgPicture.asset(
            icon,
            color: Color(0xff1B1D21).withOpacity(.5),
          ),
        ),
        title: Text(
          title,
          style: getBoldStyle(fontSize: 16.sp),
        ),
        subtitle: subTitle == null
            ? null
            : Padding(
                padding: EdgeInsets.only(top: AppPadding.p8.sp),
                child: Text(
                  subTitle!,
                  style: getMediumStyle(
                    fontSize: 14.sp,
                    color: AppColors.greyText,
                  ),
                ),
              ),
      ),
    );
  }
}
