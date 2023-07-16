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

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({Key? key}) : super(key: key);
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            children: [
              Text(
                tr(LocaleKeys.reset_password_reset_password),
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.reset_password_enter_reset_data),
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
                tr(LocaleKeys.reset_password_password),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                obscureText: true,
                icon: AppAssets.eye,
                controller: passwordController,
                hintText: tr(LocaleKeys.reset_password_password),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.reset_password_confirm_password),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                obscureText: true,
                icon: AppAssets.eye,
                controller: confirmPasswordController,
                hintText: tr(LocaleKeys.reset_password_confirm_password),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
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
                  tr(LocaleKeys.reset_password_save_password),
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
      ),
    );
  }
}
