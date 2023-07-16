import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';
import '../../../widgets/app_custome_switch.dart';
import '../../../widgets/app_profile_item.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  bool isNotify = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.profile_profile),
          style: getBoldStyle(
            fontSize: 18.sp,
            color: AppColors.black,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset(
                    width: 90.sp,
                    height: 90.sp,
                    AppAssets.logoApp,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: AppSize.s14.sp,
                ),
                Text(
                  'Abdul Aziz Al-Qahtany',
                  style: getBoldStyle(fontSize: 16.sp),
                ),
                SizedBox(
                  height: AppSize.s20.sp,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.editProfile);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 80.sp,
                    height: 34.sp,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Text(
                      tr(LocaleKeys.profile_edit),
                      style: getMediumStyle(
                        fontSize: 14.sp,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          AppProfileItem(
            title: tr(LocaleKeys.profile_payment_methods),
            subTitle: tr(LocaleKeys.profile_payment_methods_subtitle),
            icon: AppAssets.card,
            goToRoute: Routes.payment,
          ),
          AppProfileItem(
            title: tr(LocaleKeys.profile_location),
            subTitle: tr(LocaleKeys.profile_location_subtitle),
            icon: AppAssets.location,
            goToRoute: Routes.selectAddress,
          ),
          AppProfileItem(
              title: tr(LocaleKeys.profile_push_notification),
              subTitle: tr(LocaleKeys.profile_push_notification_subtitle),
              icon: AppAssets.notify,
              goToRoute: Routes.notifications,
              trailing: AppCustomSwitch(
                value: isNotify,
              )),
          AppProfileItem(
            title: tr(LocaleKeys.profile_select_language),
            icon: AppAssets.language,
            goToRoute: '',
            trailing: SizedBox(
              width: 100.sp,
              child: DropdownButtonFormField(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.black,
                ),
                style: getMediumStyle(fontSize: 14.sp, color: AppColors.black),
                decoration: InputDecoration(border: InputBorder.none),
                onChanged: (value) {},
                items: [1, 2]
                    .map((e) => DropdownMenuItem(
                          child: Text(
                            '$e',
                            textAlign: TextAlign.end,
                          ),
                          value: e,
                        ))
                    .toList(),
              ),
            ),
          ),
          AppProfileItem(
            title: tr(LocaleKeys.profile_contact_us),
            subTitle: tr(LocaleKeys.profile_contact_us_subtitle),
            icon: AppAssets.calling,
            goToRoute: Routes.contactUs,
          ),
          AppProfileItem(
            title: tr(LocaleKeys.profile_logout),
            icon: AppAssets.logout,
            goToRoute: '',
          ),
        ],
      ),
    );
  }
}
