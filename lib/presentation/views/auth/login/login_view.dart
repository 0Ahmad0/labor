import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/presentation/widgets/app_dialog.dart';
import 'package:labor/presentation/widgets/app_textform_filed.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../../widgets/app_social_button.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
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
                tr(LocaleKeys.login_login),
                textAlign: TextAlign.center,
                style: getBoldStyle(
                  fontSize: 28.sp,
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.login_enter_login_data),
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
                tr(LocaleKeys.login_phone),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                icon: AppAssets.phone,
                controller: phoneController,
                hintText: tr(LocaleKeys.login_phone),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.login_password),
                style: getSemiBoldStyle(fontSize: 16.sp),
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              AppTextFiled(
                obscureText: true,
                icon: AppAssets.eye,
                controller: passwordController,
                hintText: tr(LocaleKeys.login_password),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(
                height: AppSize.s10.sp,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.forgetPassword);
                  },
                  child: Text(
                    tr(
                      LocaleKeys.login_forget_password,
                    ),
                    style:
                        getMediumStyle(color: AppColors.black, fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    AppDialog.loadingDialog(context);
                    Future.delayed(Duration(seconds: 5), () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, Routes.navbar);
                    });
                  }
                },
                child: Text(
                  tr(LocaleKeys.login_login_button),
                  style: getBoldStyle(
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              Text(
                tr(LocaleKeys.login_or),
                style: getMediumStyle(fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SocialButton(
                icon: AppAssets.facebook,
                text: tr(LocaleKeys.login_facebook),
                onPressed: () {},
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              SocialButton(
                icon: AppAssets.google,
                text: tr(LocaleKeys.login_google),
                onPressed: () {},
              ),
              SizedBox(
                height: AppSize.s20.sp,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.register);
                },
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: tr(LocaleKeys.login_do_not_have_account),
                        style: getMediumStyle(
                            fontSize: 16.sp, color: AppColors.black)),
                    TextSpan(
                        text: tr(LocaleKeys.login_sign_up),
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
