import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/presentation/widgets/app_dialog.dart';
import 'package:labor/presentation/widgets/app_dropdown_button_form_filed.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../resources/app_colors.dart';
import '../../widgets/app_select_your_location.dart';
import '../../widgets/app_textform_filed.dart';

class AddressView extends StatelessWidget {
  AddressView({Key? key}) : super(key: key);
  final cityController = TextEditingController(text: 'Riadyh');
  final regionController = TextEditingController();
  final streetController = TextEditingController();
  final buildingController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.address_address),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            AppSelectYourLocation(
              onTap: () {
                Navigator.pushNamed(context, Routes.addAddress);
              },
              subTitle: tr(LocaleKeys.address_please_add_address),
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),

            ///
            Text(
              tr(LocaleKeys.address_city),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppDropDownButtonFormFiled(
              controller: cityController,
              items: [
                "Riadyh",
                "Makkah",
                "Syria",
                "Egypt",
                "Sudan",
                "Lebanon",
              ]
                  .map((e) => DropdownMenuItem(
                        child: Text(
                          e,
                          style: getSemiBoldStyle(
                            fontSize: 16.sp,
                          ),
                        ),
                        value: e,
                      ))
                  .toList(),
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),

            ///
            Text(
              tr(LocaleKeys.address_region),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: regionController,
              hintText: tr(LocaleKeys.address_region),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),

            ///
            Text(
              tr(LocaleKeys.login_phone),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: streetController,
              hintText: tr(LocaleKeys.address_street),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),

            ///
            Text(
              tr(LocaleKeys.login_phone),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: buildingController,
              hintText: tr(LocaleKeys.address_building),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),

            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text(
                  tr(LocaleKeys.address_add),
                  style: getBoldStyle(fontSize: 18.sp),
                ))
          ],
        ),
      ),
    );
  }
}
