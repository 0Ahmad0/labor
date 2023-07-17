import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import '../../../../models/period.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';
import '../../../widgets/app_select_your_location.dart';

class Step3 extends StatefulWidget {
  const Step3({
    super.key,
  });

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  int _selectedIndex = 0;
  late final List<Period> _periods;
  final numberOfVisitorController = TextEditingController(text: "1");
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
              AppSelectYourLocation(
                onTap: () {},
                subTitle: 'Please add Your address',
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
                value: numberOfVisitorController.text,
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
                tr(LocaleKeys.make_order_choose_date_ime),
                style: getBoldStyle(
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime(2040, 11, 20),
                onDateSelected: (date) {},
                monthColor: AppColors.greyText,
                dayColor: AppColors.black,
                activeDayColor: AppColors.white,
                activeBackgroundDayColor: AppColors.primary,
                dotsColor: Colors.transparent,
                selectableDayPredicate: (date) => date.day != 23,
                locale: 'en',
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.make_order_choose_time),
                style: getBoldStyle(fontSize: 16.sp, color: AppColors.greyText),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SizedBox(
                height: 60.sp,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: AnimatedContainer(
                        duration:
                            Duration(milliseconds: AppConstants.defaultDelay),
                        alignment: Alignment.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: _selectedIndex == index
                              ? AppColors.primary
                              : AppColors.white,
                        ),
                        child: Text(
                          "12:00 PM",
                          style: getBoldStyle(
                            fontSize: 16.sp,
                            color: _selectedIndex == index
                                ? AppColors.white
                                : AppColors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: AppSize.s10.sp,
                    );
                  },
                ),
              )
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
