import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/models/step2item.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppStep2Item extends StatefulWidget {
  final Step2Item item;

  const AppStep2Item({Key? key, required this.item}) : super(key: key);

  @override
  State<AppStep2Item> createState() => _AppStep2ItemState();
}

class _AppStep2ItemState extends State<AppStep2Item> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          widget.item.isSelected = !widget.item.isSelected;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConstants.defaultDelay),
        width: double.infinity,
        padding: EdgeInsets.all(AppPadding.p20.sp),
        margin: EdgeInsets.only(bottom: AppMargin.m20.sp),
        decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(.05),
                  blurRadius: 8.sp,
                  offset: Offset(0, 4.sp))
            ],
            border: widget.item.isSelected
                ? Border.all(color: AppColors.primary, width: 2.sp)
                : null),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: SvgPicture.asset(
                  widget.item.companyLogo,
                ),
              ),
              title: Text(
                widget.item.companyName,
                style: getBoldStyle(fontSize: 16.sp),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: AppPadding.p8.sp),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    5,
                    (index) => Icon(
                      Icons.star,
                      color: index > widget.item.companyRate
                          ? AppColors.greyText
                          : AppColors.starColor,
                    ),
                  ),
                ),
              ),
              trailing: Column(
                children: [
                  Text(
                    tr(LocaleKeys.make_order_price),
                    style: getMediumStyle(
                        fontSize: 14.sp, color: AppColors.greyText),
                  ),
                  SizedBox(
                    height: AppSize.s4.sp,
                  ),
                  Text(
                    '${widget.item.price}',
                    style: getBoldStyle(fontSize: 20.sp),
                  )
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            disabledBackgroundColor: Colors.transparent,
                            disabledForegroundColor: Colors.transparent),
                        onPressed: null,
                        icon: Text(
                          '🇸🇾',
                          style: getBoldStyle(
                            fontSize: 24.sp,
                            color: AppColors.black,
                          ),
                        ),
                        label: Text(
                          //TODO getName IconFlag
                          'nationality',
                          style: getMediumStyle(
                              fontSize: 14.sp, color: AppColors.black),
                        ))),
                Expanded(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: SvgPicture.asset(AppAssets.order_type),
                        label: Text(
                          widget.item.type,
                          style: getMediumStyle(
                              fontSize: 14.sp, color: AppColors.black),
                        ))),
                Expanded(
                    child: TextButton.icon(
                        onPressed: null,
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: AppColors.black,
                        ),
                        label: Text(
                          widget.item.time,
                          style: getMediumStyle(
                              fontSize: 14.sp, color: AppColors.black),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
