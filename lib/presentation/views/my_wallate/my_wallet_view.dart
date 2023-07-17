import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

class MyWalletView extends StatelessWidget {
  const MyWalletView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.my_wallet_my_wallet),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.darkGreen,
              borderRadius: BorderRadius.circular(14.r),
            ),
            child: ListTile(
              leading: SvgPicture.asset(AppAssets.wallet2),
              title: Text(
                tr(LocaleKeys.my_wallet_my_balance),
                style:
                    getSemiBoldStyle(fontSize: 14.sp, color: AppColors.white),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: AppPadding.p8.sp),
                child: Text(
                  '2500 S.R',
                  style: getBoldStyle(fontSize: 18.sp, color: AppColors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Column(
            children: List.generate(5, (index) {
              return Container(
                padding: EdgeInsets.all(AppPadding.p20.sp),
                margin: EdgeInsets.only(bottom: AppMargin.m20.sp),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.sp),
                  border: Border.all(color: AppColors.greyText),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                        width: 150.sp,
                        height: 34.sp,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: index.isEven
                              ? AppColors.primary
                              : AppColors.error,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          index.isEven
                              ? tr(LocaleKeys.my_wallet_add_to_wallet)
                              : tr(LocaleKeys.my_wallet_wallet_discount),
                          style: getSemiBoldStyle(
                              fontSize: 14.sp, color: AppColors.white),
                        ),
                      ),
                      trailing: Text(
                        '2H',
                        overflow: TextOverflow.ellipsis,
                        style: getMediumStyle(
                            fontSize: 12.sp, color: AppColors.greyText),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s10.sp,
                    ),
                    Text(
                      index.isEven
                          ? tr(LocaleKeys.my_wallet_added_to_your_balance)
                          : tr(LocaleKeys.my_wallet_have_been_wallet_discount),
                      style: getMediumStyle(
                        fontSize: 14.sp,
                        color: AppColors.greyText,
                      ),
                    )
                  ],
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
