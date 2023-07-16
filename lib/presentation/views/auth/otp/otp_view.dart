import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';

class OTPView extends StatefulWidget {
  OTPView({Key? key}) : super(key: key);

  @override
  State<OTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> {
  final otpController = TextEditingController();
  int secondsRemaining = 60;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 60;
      enableResend = false;
    });
  }

  @override
  dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            Text(
              tr(LocaleKeys.otp_otp),
              textAlign: TextAlign.center,
              style: getBoldStyle(
                fontSize: 28.sp,
              ),
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: tr(LocaleKeys.otp_enter_code_sent),
                ),
                TextSpan(
                    text: '(+02) 01003625286  ',
                    style: getRegularStyle(
                      fontSize: 14.sp,
                      color: AppColors.yellow,
                    ).copyWith(height: 2.sp))
              ]),
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: 14.sp,
                color: AppColors.greyText,
              ),
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            Pinput(
              autofocus: true,
              defaultPinTheme: pinDecoration.copyWith(
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.grey,
                      ))),
              focusedPinTheme: pinDecoration,
              followingPinTheme: pinDecoration.copyWith(
                  decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: AppColors.grey,
                      ))),
              submittedPinTheme: pinDecoration,
              pinAnimationType: PinAnimationType.slide,
              controller: otpController,
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            ElevatedButton(
              onPressed: () {},
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
            Text(
              tr(LocaleKeys.otp_enter_code_sent),
              textAlign: TextAlign.center,
              style: getRegularStyle(
                fontSize: 14.sp,
                color: AppColors.greyText,
              ),
            ),
            InkWell(
              onTap: enableResend ? _resendCode : null,
              child: Text(
                enableResend
                    ? '${tr(LocaleKeys.otp_resend)}'
                    : '00:$secondsRemaining',
                textAlign: TextAlign.center,
                style: getRegularStyle(
                  fontSize: 14.sp,
                  color: AppColors.yellow,
                ).copyWith(height: 2.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final pinDecoration = PinTheme(
  margin: EdgeInsets.symmetric(horizontal: AppMargin.m8.sp),
  textStyle: getMediumStyle(
    fontSize: 24.sp,
  ),
  width: 50.sp,
  height: 60.sp,
  decoration: BoxDecoration(
      color: AppColors.primary.withOpacity(.1),
      borderRadius: BorderRadius.circular(8.r),
      border: Border.all(
        color: AppColors.primary,
      )),
);
