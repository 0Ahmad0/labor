import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/models/address.dart';
import 'package:labor/presentation/resources/app_constants.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppSelectAddressItem extends StatefulWidget {
  const AppSelectAddressItem({
    super.key,
    required this.address,
  });

  final Address address;

  @override
  State<AppSelectAddressItem> createState() => _AppSelectAddressItemState();
}

class _AppSelectAddressItemState extends State<AppSelectAddressItem> {
  Color _getBackgroundColor(bool isSelect) {
    return isSelect ? AppColors.primary : AppColors.white;
  }

  Color _getBackgroundCircleColor(bool isSelect) {
    return isSelect ? AppColors.white : AppColors.primary;
  }

  Color _getIconLocationColor(bool isSelect) {
    return isSelect ? AppColors.yellow : AppColors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.address.isSelect = !widget.address.isSelect;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConstants.defaultDelay),
        margin: EdgeInsets.only(bottom: AppMargin.m24.sp),
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
        width: double.infinity,
        decoration: BoxDecoration(
            color: _getBackgroundColor(widget.address.isSelect),
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: [
              BoxShadow(
                  color: AppColors.black.withOpacity(.05),
                  blurRadius: 8.sp,
                  offset: Offset(0, 4.sp))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.sp,
              backgroundColor:
                  _getBackgroundCircleColor(widget.address.isSelect),
              child: Icon(
                Icons.location_on_rounded,
                color: _getIconLocationColor(widget.address.isSelect),
              ),
            ),
            SizedBox(
              width: AppSize.s20.sp,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      CustomListTitle(
                        title: tr(LocaleKeys.select_address_city),
                        subTitle: 'Riyadh',
                        isSelect: widget.address.isSelect,
                      ),
                      Expanded(child: SizedBox()),
                      CustomListTitle(
                        title: tr(LocaleKeys.select_address_street),
                        subTitle: 'Non',
                        isSelect: widget.address.isSelect,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      CustomListTitle(
                        title: tr(LocaleKeys.select_address_region),
                        subTitle: 'Alexander Language School',
                        isSelect: widget.address.isSelect,
                      ),
                      Expanded(child: SizedBox()),
                      CustomListTitle(
                        title: tr(LocaleKeys.select_address_building),
                        subTitle: '2 Floor',
                        isSelect: widget.address.isSelect,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomListTitle extends StatelessWidget {
  const CustomListTitle({
    super.key,
    required this.title,
    required this.subTitle,
    required this.isSelect,
  });

  final String title;
  final String subTitle;
  final bool isSelect;

  Color _getSubTitleColor(bool isSelect) {
    return isSelect ? AppColors.white : AppColors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: AppConstants.flexExpandedSelectAddress,
      child: ListTile(
        isThreeLine: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: getMediumStyle(fontSize: 10.sp, color: AppColors.lightGrey),
        ),
        subtitle: Text(
          subTitle,
          style:
              getBoldStyle(fontSize: 12.sp, color: _getSubTitleColor(isSelect)),
        ),
      ),
    );
  }
}
