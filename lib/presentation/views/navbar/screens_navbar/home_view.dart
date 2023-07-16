import 'dart:async';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../models/categories.dart';
import '../../../widgets/app_select_your_location.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final PageController _pageController = PageController(initialPage: 0);
  late Timer _timer;
  int _currentPage = 0;
  int _numPages = 3;
  Duration _duration = Duration(seconds: AppConstants.homeDelay);
  late final List<Categories> _categories;

  void _startTimer() {
    _timer = Timer.periodic(_duration, (Timer timer) {
      _currentPage = (_currentPage + 1) % _numPages;
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  void _fillCategoriesList() {
    _categories = [
      Categories(
          image: AppAssets.category1,
          name: tr(LocaleKeys.home_hourly_cleaning)),
      Categories(
        image: AppAssets.category2,
        name: tr(LocaleKeys.home_contract_cleaning),
      ),
      Categories(
        image: AppAssets.category3,
        name: tr(LocaleKeys.home_electrical),
      ),
      Categories(
        image: AppAssets.category4,
        name: tr(LocaleKeys.home_car_wash),
      ),
      Categories(
        image: AppAssets.category5,
        name: tr(LocaleKeys.home_conditioning),
      ),
      Categories(
        image: AppAssets.category6,
        name: tr(LocaleKeys.home_plumbing),
      )
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillCategoriesList();
    _startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AppAssets.logo),
        leading: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.all(AppPadding.p16.sp),
            child: SvgPicture.asset(
              AppAssets.notification,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        children: [
          SizedBox(
            height: AppSize.s10.sp,
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(
                text: tr(LocaleKeys.home_good_morning),
              ),
              TextSpan(
                  text: '  Ahmad Alhariri',
                  style:
                      getMediumStyle(fontSize: 14.sp, color: AppColors.yellow)),
            ], style: getMediumStyle(fontSize: 14.sp)),
          ),
          SizedBox(
            height: AppSize.s10.sp,
          ),
          Text(
            tr(LocaleKeys.home_find_your_service),
            style: getBoldStyle(
              fontSize: 24.sp,
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          AppSelectYourLocation(
            subTitle: 'Jiddah Alexander Language School , ALS',
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Column(
            children: [
              SizedBox(
                height: 140.sp,
                width: double.infinity,
                child: PageView.builder(
                    reverse: true,
                    controller: _pageController,
                    itemCount: _numPages,
                    itemBuilder: (_, index) {
                      return Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.r),
                            child: SvgPicture.asset(
                              AppAssets.homeSlider,
                              fit: BoxFit.cover,
                              width: double.infinity,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppPadding.p20.sp),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      AppAssets.logo,
                                      color: AppColors.white,
                                    ),
                                    SizedBox(
                                      height: AppSize.s10.sp,
                                    ),
                                    Text(
                                      tr(LocaleKeys.home_all_you_need),
                                      style: getBoldStyle(
                                          fontSize: 20.sp,
                                          color: AppColors.white),
                                    )
                                  ],
                                ),
                                Expanded(
                                  child: SizedBox(
                                    height: double.infinity,
                                    width: double.infinity,
                                    child: Image.asset(
                                      AppAssets.personHome,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    }),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: _numPages,
                effect: WormEffect(
                    dotWidth: 8.sp,
                    dotHeight: 8.sp,
                    dotColor: AppColors.grey,
                    activeDotColor: AppColors.darkGreen),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Text(
                  tr(LocaleKeys.home_our_services),
                  style: getBoldStyle(fontSize: 18.sp),
                ),
                trailing: TextButton(
                  onPressed: () {},
                  child: Text(
                    tr(LocaleKeys.home_see_all),
                    style: getBoldStyle(fontSize: 12.sp),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              GridView.builder(
                itemCount: _categories.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.sp,
                    childAspectRatio: 1.sp,
                    mainAxisSpacing: 24.sp),
                itemBuilder: (_, index) {
                  final category = _categories[index];
                  return Container(
                    decoration:
                        BoxDecoration(color: AppColors.white, boxShadow: [
                      BoxShadow(
                        color: AppColors.black.withOpacity(.05),
                        blurRadius: 8.sp,
                        offset: Offset(0, 4.sp),
                      ),
                    ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(category.image),
                        Text(category.name)
                      ],
                    ),
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
