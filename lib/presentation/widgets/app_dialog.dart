import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/presentation/resources/app_routes.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppDialog {
  const AppDialog._();

  static showSuccessDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: AppColors.barrierColor,
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              return await false;
            },
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: AppPadding.p40.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r)),
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p34.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppAssets.confirmDialog),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    Text(
                      tr(LocaleKeys.dialog_completed),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(fontSize: 18.sp),
                    ),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    Text(
                      tr(LocaleKeys.dialog_confirmation_message_will_be_sent),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          fontSize: 14.sp, color: AppColors.greyText),
                    ),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.navbar);
                      },
                      child: Text(
                        tr(LocaleKeys.dialog_home),
                        style: getBoldStyle(fontSize: 18.sp),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        tr(LocaleKeys.dialog_cancel),
                        style: getBoldStyle(
                            fontSize: 14.sp, color: AppColors.greyText),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static underReviewDialog(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        barrierColor: AppColors.barrierColor,
        context: context,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              return await false;
            },
            child: Dialog(
              insetPadding: EdgeInsets.symmetric(horizontal: AppPadding.p40.sp),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.r)),
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p34.sp),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(AppAssets.reviewDialog),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    Text(
                      tr(LocaleKeys.dialog_review),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(fontSize: 18.sp),
                    ),
                    Text(
                      tr(LocaleKeys.dialog_dispatched_on_time),
                      textAlign: TextAlign.center,
                      style: getBoldStyle(
                          fontSize: 14.sp, color: AppColors.greyText),
                    ),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.navbar);
                      },
                      child: Text(
                        tr(LocaleKeys.dialog_home),
                        style: getBoldStyle(fontSize: 18.sp),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s10.sp,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        tr(LocaleKeys.dialog_cancel),
                        style: getBoldStyle(
                            fontSize: 14.sp, color: AppColors.greyText),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  static loadingDialog(BuildContext context) {
    showDialog(
        barrierColor: AppColors.barrierColor,
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return WillPopScope(
            onWillPop: () async {
              return await false;
            },
            child: Center(
              child: SpinKitWaveSpinner(
                size: ScreenUtil.defaultSize.width / 3.5,
                trackColor: AppColors.white,
                waveColor: AppColors.primary,
                color: AppColors.darkGreen,
              ),
            ),
          );
        });
  }
}
