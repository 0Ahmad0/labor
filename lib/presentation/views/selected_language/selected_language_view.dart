import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

class SelectedLanguageView extends StatelessWidget {
  SelectedLanguageView({Key? key}) : super(key: key);
  SelectedLanguage selectedLanguage = SelectedLanguage.english;
  bool agreeOurTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSize.s50.sp,
              ),
              Image.asset(AppAssets.logoApp),
              SizedBox(
                height: AppSize.s50.sp,
              ),
              Text(tr(LocaleKeys.find_your_home_service),
                  style: getBoldStyle(
                    fontSize: 48.sp,
                  )),
              SizedBox(
                height: AppSize.s50.sp,
              ),
              Text(
                tr(LocaleKeys.select_language),
                style: getBoldStyle(fontSize: 20.sp),
              ),
              SizedBox(
                height: AppSize.s30.sp,
              ),
              InkWell(
                onTap: () {
                  selectedLanguage = SelectedLanguage.english;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr(LocaleKeys.english),
                      style: getSemiBoldStyle(fontSize: 16.sp),
                    ),
                    Radio(
                      value: SelectedLanguage.english,
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        selectedLanguage = value!;
                      },
                    )
                  ],
                ),
              ),
              Divider(
                height: 0.0,
                color: AppColors.black,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              InkWell(
                onTap: () {
                  selectedLanguage = SelectedLanguage.arabic;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tr(LocaleKeys.arabic),
                      style: getSemiBoldStyle(fontSize: 16.sp),
                    ),
                    Radio(
                      value: SelectedLanguage.arabic,
                      groupValue: selectedLanguage,
                      onChanged: (value) {
                        selectedLanguage = value!;
                      },
                    )
                  ],
                ),
              ),
              Divider(
                height: 0.0,
                color: AppColors.black,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              InkWell(
                onTap: () {
                  agreeOurTerms = !agreeOurTerms;
                },
                child: Row(
                  children: [
                    Checkbox(
                      value: agreeOurTerms,
                      onChanged: (value) {
                        agreeOurTerms = value!;
                      },
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: tr(LocaleKeys.agree_our),
                          style: getRegularStyle(
                            fontSize: 12.sp,
                            color: AppColors.lightGrey,
                          )),
                      TextSpan(
                          text: '\n' + tr(LocaleKeys.select_terms),
                          style: getBoldStyle(
                            fontSize: 12.sp,
                            color: AppColors.primary,
                          )),
                    ]))
                  ],
                ),
              ),
              const Spacer(),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.onBoarding);
                  },
                  child: Text(tr(LocaleKeys.enter))),
              SizedBox(
                height: AppSize.s20.sp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
