import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/widgets/app_step2_item.dart';

import '../../../../models/period.dart';
import '../../../../models/step2item.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';

class Step2 extends StatefulWidget {
  const Step2({
    super.key,
  });

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late final List<Step2Item> _items;

  _fillList() {
    _items = [
      Step2Item(
          companyLogo: AppAssets.phone,
          companyName: 'companyName',
          companyRate: 3,
          price: 1100,
          isSelected: true,
          type: 'type',
          nationality: '🇸🇾',
          time: '4 Hours'),
      Step2Item(
          companyLogo: AppAssets.elo,
          companyName: 'companyName',
          companyRate: 1,
          price: 1100,
          isSelected: false,
          type: 'type',
          nationality: '🇸🇾',
          time: '4 Hours'),
      Step2Item(
          companyLogo: AppAssets.night,
          companyName: 'companyName',
          companyRate: 5,
          price: 1100,
          isSelected: false,
          type: 'type',
          nationality: '🇸🇾',
          time: '4 Hours'),
      Step2Item(
          companyLogo: AppAssets.americanExpress,
          companyName: 'companyName',
          companyRate: 4,
          isSelected: false,
          price: 1100,
          type: 'type',
          nationality: '🇸🇾',
          time: '4 Hours'),
      Step2Item(
          companyLogo: AppAssets.sun,
          companyName: 'companyName',
          companyRate: 1,
          price: 1100,
          isSelected: false,
          type: 'type',
          nationality: '🇸🇾',
          time: '4 Hours'),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            children: [
              Text(
                tr(LocaleKeys.make_order_fliter),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Row(
                children: [
                  PopupMenuButton(
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(child: Text('tr1')),
                        PopupMenuItem(child: Text('tr2')),
                      ];
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.p8.sp,
                          horizontal: AppPadding.p20.sp),
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Row(
                        children: [
                          Text(
                            tr(LocaleKeys.make_order_price),
                            style: getBoldStyle(
                                fontSize: 14.sp, color: AppColors.black),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: AppSize.s10.sp,
                  ),
                  PopupMenuButton(
                    itemBuilder: (_) {
                      return [
                        PopupMenuItem(child: Text('tr1')),
                        PopupMenuItem(child: Text('tr2')),
                      ];
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: AppPadding.p8.sp,
                          horizontal: AppPadding.p20.sp),
                      decoration: BoxDecoration(color: AppColors.white),
                      child: Row(
                        children: [
                          Text(
                            tr(LocaleKeys.make_order_evaluation),
                            style: getBoldStyle(
                                fontSize: 14.sp, color: AppColors.black),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Column(
                children: List.generate(
                  _items.length,
                  (index) => AppStep2Item(item: _items[index]),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
