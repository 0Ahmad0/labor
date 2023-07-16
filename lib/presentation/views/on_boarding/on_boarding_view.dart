import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_strings.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/on_boarding_modle.dart';
import '../../resources/app_colors.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController pageController;
  late List<OnBoardingModel> _onBoardingItems;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    _onBoardingItems = [
      OnBoardingModel(
          image: AppAssets.intro1,
          title: tr(LocaleKeys.intro_easy_process),
          subTitle: tr(LocaleKeys.intro_easy_process_sub_tile)),
      OnBoardingModel(
          image: AppAssets.intro2,
          title: tr(LocaleKeys.intro_expert_people),
          subTitle: tr(LocaleKeys.intro_expert_people_sub_tile)),
      OnBoardingModel(
          image: AppAssets.intro3,
          title: tr(LocaleKeys.intro_all_in_one_place),
          subTitle: tr(LocaleKeys.intro_all_in_one_place_sub_tile)),
    ];
  }

  int _currentIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                      log('${_currentIndex}');
                    },
                    controller: pageController,
                    itemCount: _onBoardingItems.length,
                    itemBuilder: (context, index) {
                      final item = _onBoardingItems[index];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(item.image),
                          SizedBox(
                            height: AppSize.s20.sp,
                          ),
                          Text(
                            item.title,
                            textAlign: TextAlign.center,
                            style: getMediumStyle(
                              fontSize: 34.sp,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(AppPadding.p40.sp),
                            child: Text(
                              item.subTitle,
                              style: getRegularStyle(
                                fontSize: 14.sp,
                                color: AppColors.lightGrey,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p20.sp),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: _onBoardingItems.length,
                    effect: ExpandingDotsEffect(
                        dotWidth: AppSize.s10.sp,
                        dotHeight: AppSize.s10.sp,
                        activeDotColor: AppColors.yellow,
                        dotColor: AppColors.grey), // your preferred effect
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(AppPadding.p20.sp),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_currentIndex != _onBoardingItems.length - 1)
                          pageController.nextPage(
                              duration: const Duration(
                                  milliseconds: AppConstants.onBoardingDelay),
                              curve: Curves.easeInOut);
                        else
                          Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: Text(_currentIndex == _onBoardingItems.length - 1
                          ? tr(LocaleKeys.enter)
                          : tr(LocaleKeys.next))),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.login);
              },
              child: Text(
                tr(
                  LocaleKeys.skip,
                ),
                style: getBoldStyle(fontSize: 18.sp, color: AppColors.yellow),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
