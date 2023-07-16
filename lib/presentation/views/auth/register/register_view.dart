import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_routes.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';
import '../../../widgets/app_social_button.dart';
import '../../../widgets/app_textform_filed.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  final nameController = TextEditingController(text: 'Abdul Aziz Al-Qahtany');
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            children: [
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_register),
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_enter_register_data),
                textAlign: TextAlign.center,
                style: getRegularStyle(
                  fontSize: 14.sp,
                  color: AppColors.greyText,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_full_name),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                icon: AppAssets.user,
                controller: nameController,
                hintText: tr(LocaleKeys.register_full_name),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_phone),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                icon: AppAssets.phone,
                controller: phoneController,
                hintText: tr(LocaleKeys.register_phone),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_password),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                obscureText: true,
                icon: AppAssets.eye,
                controller: passwordController,
                hintText: tr(LocaleKeys.register_password),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, Routes.otp);
                  }
                },
                child: Text(
                  tr(LocaleKeys.register_register_button),
                  style: getBoldStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.register_or),
                style: getMediumStyle(fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SocialButton(
                icon: AppAssets.facebook,
                text: tr(LocaleKeys.register_facebook),
                onPressed: () {},
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SocialButton(
                icon: AppAssets.google,
                text: tr(LocaleKeys.register_google),
                onPressed: () {},
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.login);
                },
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: tr(LocaleKeys.register_have_account),
                        style: getMediumStyle(
                            fontSize: 16.sp, color: AppColors.black)),
                    TextSpan(
                        text: tr(LocaleKeys.register_sign_in),
                        style: getBoldStyle(
                            fontSize: 16.sp, color: AppColors.black))
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
