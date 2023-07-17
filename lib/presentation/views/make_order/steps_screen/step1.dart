import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/period.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';

class Step1 extends StatefulWidget {
  const Step1({
    super.key,
  });

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  int _selectedIndex = 0;
  late final List<Period> _periods;
  final numberHoursController = TextEditingController(text: "1");
  final nationalityController = TextEditingController(text: '🇸🇾');
  final cityController = TextEditingController(text: "Riadh");

  _fillList() {
    _periods = [
      Period(name: tr(LocaleKeys.make_order_morning), icon: AppAssets.sun),
      Period(name: tr(LocaleKeys.make_order_night), icon: AppAssets.night),
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
                tr(LocaleKeys.make_order_period),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    _periods.length,
                    (index) => Expanded(
                          child: TextButton.icon(
                            style: TextButton.styleFrom(
                              backgroundColor: AppColors.white,
                              minimumSize:
                                  Size(double.infinity, AppSize.s60.sp),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                side: BorderSide(
                                    width: 2.sp,
                                    color: _selectedIndex == index
                                        ? AppColors.yellow
                                        : Colors.transparent),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                _selectedIndex = index;
                              });
                            },
                            label: Text(
                              _periods[index].name,
                              style: getBoldStyle(
                                  fontSize: 16.sp, color: AppColors.black),
                            ),
                            icon: SvgPicture.asset(_periods[index].icon),
                          ),
                        )),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.make_order_number_of_hours),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              DropdownButtonFormField(
                icon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: AppColors.black,
                ),
                value: numberHoursController.text,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: AppColors.white,
                  filled: true,
                ),
                items: ["1", "2", "3", "4", "5", "6"]
                    .map((e) => DropdownMenuItem(
                          child: Text(
                            '$e',
                            style: getBoldStyle(fontSize: 14.sp),
                          ),
                          value: e,
                        ))
                    .toList(),
                onChanged: (value) {},
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.make_order_nationality),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: AppColors.white,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.black,
                  ),
                  prefixIcon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        nationalityController.text,
                        style: getBoldStyle(
                          fontSize: 26.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (val) {
                      setState(() {
                        nationalityController.text = val.flagEmoji;
                      });
                    },
                  );
                },
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.make_order_city),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: AppColors.white,
                  filled: true,
                  suffixIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: AppColors.black,
                  ),
                  prefixIcon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cityController.text,
                        style: getBoldStyle(fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (val) {
                      setState(() {
                        cityController.text = val.displayName;
                      });
                    },
                  );
                },
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.white),
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                tr(LocaleKeys.make_order_next),
                style: getBoldStyle(fontSize: 16.sp),
              )),
        )
      ],
    );
  }
}
