import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../translations/locale_keys.g.dart';
import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppDropDownButtonFormFiled extends StatelessWidget {
  const AppDropDownButtonFormFiled({
    super.key,
    required this.controller,
    required this.items,
  });

  final TextEditingController controller;
  final List<DropdownMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: controller.text,
      decoration: InputDecoration(
        hintText: tr(LocaleKeys.add_card_card_type),
        contentPadding: EdgeInsets.symmetric(
          vertical: AppPadding.p18.sp,
          horizontal: AppPadding.p12,
        ),
        hintStyle: getSemiBoldStyle(fontSize: 16.sp, color: AppColors.greyText),
        filled: true,
        fillColor: AppColors.primary.withOpacity(.05),
        enabledBorder: dropDownBorder.copyWith(
            borderSide: BorderSide(color: AppColors.grey)),
        border: dropDownBorder.copyWith(
            borderSide: BorderSide(color: AppColors.grey)),
        disabledBorder: dropDownBorder.copyWith(
            borderSide: BorderSide(color: AppColors.grey)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primary),
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.black,
      ),
      items: items,
      validator: (value) {
        if (value == null) {
          return tr(LocaleKeys.filed_required);
        }
        return null;
      },
      onChanged: (value) {
        controller.text = value!;
      },
    );
  }
}

final dropDownBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      color: AppColors.grey,
    ));
