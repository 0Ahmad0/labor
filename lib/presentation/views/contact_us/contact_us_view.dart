import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../resources/app_assets.dart';
import '../../widgets/app_textform_filed.dart';

class ContactUsView extends StatelessWidget {
  ContactUsView({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr(LocaleKeys.contact_us_contact_us),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            Text(
              tr(LocaleKeys.contact_us_contact_us_enter_data),
              style:
                  getSemiBoldStyle(fontSize: 20.sp, color: AppColors.greyText),
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.contact_us_name),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: nameController,
              hintText: tr(LocaleKeys.contact_us_name),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.contact_us_phone),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: phoneController,
              hintText: tr(LocaleKeys.contact_us_phone),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.contact_us_massage),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              minline: AppConstants.minLineContactUsTextFiled,
              maxline: AppConstants.maxLineContactUsTextFiled,
              controller: messageController,
              hintText: tr(LocaleKeys.contact_us_massage),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.multiline,
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text(
                  tr(LocaleKeys.contact_us_send),
                  style: getBoldStyle(fontSize: 16.sp),
                ))
          ],
        ),
      ),
    );
  }
}
