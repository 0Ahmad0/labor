import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_colors.dart';
import '../resources/app_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
  });

  final String text;
  final String icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            side: BorderSide(
              color: AppColors.grey,
              width: 1.sp,
            ),
            borderRadius: BorderRadius.circular(12.r)),
        elevation: 0.0,
        backgroundColor: AppColors.primary.withOpacity(.05),
      ),
      onPressed: onPressed,
      icon: SvgPicture.asset(icon),
      label: Text(
        text,
        style: getBoldStyle(fontSize: 18.sp, color: AppColors.black)
            .copyWith(letterSpacing: 1.sp),
      ),
    );
  }
}
