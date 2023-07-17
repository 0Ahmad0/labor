import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

class MakeOrderView extends StatefulWidget {
  const MakeOrderView({Key? key}) : super(key: key);

  @override
  State<MakeOrderView> createState() => _MakeOrderViewState();
}

class _MakeOrderViewState extends State<MakeOrderView> {
  int _currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hourly cleaning',
                        textAlign: TextAlign.start,
                        style: getBoldStyle(
                          fontSize: 24.sp,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: AppSize.s20.sp,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          3,
                          (index) => Expanded(
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: _currentIndex == index
                                      ? AppColors.primary
                                      : AppColors.grey,
                                  radius: 14.sp,
                                  child: Text(
                                    '${index + 1}',
                                    style: getBoldStyle(
                                      fontSize: 12.sp,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: AppSize.s4.sp,
                                ),
                                Text(
                                  tr(LocaleKeys.make_order_step) +
                                      ' ${index + 1}',
                                  overflow: TextOverflow.ellipsis,
                                  style: getBoldStyle(fontSize: 10.sp),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset(
                  AppAssets.category1,
                )
              ],
            ),
          ),
          Expanded(
              child: PageView(
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: pageController,
            children: [
              Container(
                color: Colors.redAccent,
              ),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.pinkAccent,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
