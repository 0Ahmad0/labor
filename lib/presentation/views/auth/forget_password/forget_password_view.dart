import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_routes.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';
import '../../../widgets/app_textform_filed.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({Key? key}) : super(key: key);
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            Text(
              tr(LocaleKeys.forget_password_forget_password),
              textAlign: TextAlign.center,
              style: getBoldStyle(
                fontSize: 28.sp,
              ),
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.forget_password_enter_forget_data),
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: 14.sp,
                color: AppColors.greyText,
              ),
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            Text(
              tr(LocaleKeys.forget_password_phone),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            Form(
              key: _formKey,
              child: AppTextFiled(
                icon: AppAssets.phone,
                controller: phoneController,
                hintText: tr(LocaleKeys.forget_password_phone),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.pushNamed(context, Routes.resetPassword);
                }
              },
              child: Text(
                tr(LocaleKeys.otp_submit),
                style: getBoldStyle(
                  fontSize: 18.sp,
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
          ],
        ),
      ),
    );
  }
}
