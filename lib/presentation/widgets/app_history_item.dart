import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

class AppHistoryItem extends StatelessWidget {
  const AppHistoryItem({
    super.key,
    required this.type,
    required this.status,
    required this.id,
    required this.image,
    required this.companyName,
    required this.date,
    required this.price,
    required this.rate,
    required this.description,
    this.statusHistoryItem = StatusHistoryItem.inReview,
  });

  final String type;
  final String status;
  final String id;
  final String image;
  final String companyName;
  final String date;
  final double price;
  final StatusHistoryItem statusHistoryItem;
  final int rate;
  final String description;

  Color _setStatusColor(StatusHistoryItem statusHistoryItem) {
    switch (statusHistoryItem) {
      case StatusHistoryItem.accept:
        return AppColors.primary;
      case StatusHistoryItem.cancel:
        return AppColors.error;
      case StatusHistoryItem.done:
        return AppColors.primary;
      case StatusHistoryItem.inReview:
        return AppColors.greyText;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: AppMargin.m14.sp),
      padding: EdgeInsets.all(AppPadding.p18.sp),
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(24.sp),
          boxShadow: [
            BoxShadow(
                color: AppColors.black.withOpacity(.05),
                offset: Offset(0, 4.sp),
                blurRadius: 8.sp)
          ]),
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              type,
              style: getBoldStyle(
                fontSize: 16.sp,
              ),
            ),
            subtitle: Text(
              id,
              style: getMediumStyle(fontSize: 12.sp, color: AppColors.greyText),
            ),
            trailing: InkWell(
              child: Container(
                alignment: Alignment.center,
                width: 100.sp,
                height: 40.sp,
                decoration: BoxDecoration(
                  color: _setStatusColor(statusHistoryItem),
                  borderRadius: BorderRadius.circular(100.r),
                ),
                child: FittedBox(
                  child: Text(
                    status,
                    style:
                        getBoldStyle(fontSize: 12.sp, color: AppColors.white),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          SizedBox(
            height: AppSize.s4.sp,
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Routes.company);
            },
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              backgroundColor: AppColors.primary,
              radius: 26.sp,
            ),
            title: Text(
              companyName,
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(top: AppPadding.p4.sp),
              child: Row(
                  children: List.generate(
                rate,
                (_) => Icon(
                  Icons.star,
                  size: 24.sp,
                  color: AppColors.starColor,
                ),
              )),
            ),
            trailing: Text(
              date,
              style: getSemiBoldStyle(
                fontSize: 12.sp,
                color: AppColors.greyText,
              ),
            ),
          ),
          const Divider(
            height: 0,
          ),
          SizedBox(
            height: AppSize.s4.sp,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              description,
              style: getMediumStyle(
                fontSize: 12.sp,
                color: AppColors.greyText,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  tr(LocaleKeys.history_price),
                  style: getMediumStyle(
                      fontSize: 12.sp, color: AppColors.greyText),
                ),
                SizedBox(
                  height: AppSize.s4.sp,
                ),
                Text(
                  '$price',
                  style: getBoldStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: statusHistoryItem == StatusHistoryItem.accept,
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
                      tr(LocaleKeys.history_complete_payment),
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
