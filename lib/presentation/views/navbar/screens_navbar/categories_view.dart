import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/translations/locale_keys.g.dart';
import '../../../../models/categories.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  late final List<Categories> _categories;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            tr(LocaleKeys.categories_categories),
            style: getBoldStyle(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
        ),
        body: GridView.builder(
          padding: EdgeInsets.all(AppPadding.p20.sp),
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
              decoration: BoxDecoration(color: AppColors.white, boxShadow: [
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
        ));
  }
}
