import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/widgets/app_textform_filed.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../resources/app_values.dart';

class CompanyView extends StatelessWidget {
  CompanyView({Key? key}) : super(key: key);
  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.company_company),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppPadding.p20.sp),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(AppAssets.logoApp),
                SizedBox(
                  height: AppSize.s20.sp,
                ),
                Text(
                  'United Group Company',
                  style: getBoldStyle(
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(
                  height: AppSize.s20.sp,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.starColor,
                    ),
                    SizedBox(
                      width: AppSize.s10.sp,
                    ),
                    Text(
                      '4.5',
                      style: getBoldStyle(fontSize: 18.sp),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSize.s20.sp,
                ),
                Text(
                  'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium . Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.',
                  style: getMediumStyle(
                      fontSize: 16.sp, color: AppColors.greyText),
                ),
                SizedBox(
                  height: AppSize.s20.sp,
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppPadding.p20.sp),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(LocaleKeys.company_add_your_rate),
                  style: getBoldStyle(fontSize: 16.sp),
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  glow: false,
                  direction: Axis.horizontal,
                  itemCount: AppConstants.itemCountRating,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: AppColors.starColor,
                  ),
                  onRatingUpdate: (rating) {
                    log('${rating}');
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppPadding.p20.sp),
            decoration: BoxDecoration(color: AppColors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(LocaleKeys.company_comments),
                  style: getBoldStyle(fontSize: 16.sp),
                ),
                ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Column(
                      children: List.generate(
                        2,
                        (index) => Column(
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                radius: 26.sp,
                              ),
                              title: Text(
                                'data',
                                style: getBoldStyle(fontSize: 14.sp),
                              ),
                              subtitle: Text(
                                '${AppDateFormat.toDate(DateTime.now())}',
                                style: getRegularStyle(
                                    fontSize: 12.sp, color: AppColors.greyText),
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s10.sp,
                            ),
                            Text(
                              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremqu',
                              style: getMediumStyle(
                                  fontSize: 14.sp, color: AppColors.greyText),
                            ),
                            SizedBox(
                              height: AppSize.s10.sp,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s20.sp,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppTextFiled(
                            controller: commentController,
                            hintText:
                                tr(LocaleKeys.company_add_your_comment_hint),
                          ),
                        ),
                        SizedBox(
                          width: AppSize.s10.sp,
                        ),
                        InkWell(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 26.sp,
                            child: Icon(
                              Icons.send,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
