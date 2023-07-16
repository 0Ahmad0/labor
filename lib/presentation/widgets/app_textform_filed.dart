import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../resources/app_colors.dart';
import '../resources/app_values.dart';

class AppTextFiled extends StatefulWidget {
  AppTextFiled(
      {Key? key,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      this.controller,
      this.iconData,
      this.hintText,
      this.obscureText = false,
      this.suffixIcon = false,
      this.validator,
      this.onChanged,
      this.onTap,
      this.autofocus = false,
      this.readOnly = false,
      this.maxline = 1,
      this.minline = 1,
      this.icon})
      : super(key: key);

  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final IconData? iconData;
  final String? hintText;
  final bool suffixIcon;
  final bool autofocus;
  final bool readOnly;
  bool obscureText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final VoidCallback? onTap;
  final int? maxline;
  final int? minline;
  final String? icon;

  @override
  State<AppTextFiled> createState() => _AppTextFiledState();
}

class _AppTextFiledState extends State<AppTextFiled> {
  void _showPassword() {
    setState(() {
      widget.obscureText = !widget.obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: getSemiBoldStyle(fontSize: 16.sp),
      maxLines: widget.maxline,
      minLines: widget.minline,
      readOnly: widget.readOnly,
      autofocus: widget.autofocus,
      validator: widget.validator ??
          (String? val) {
            if (val!.trim().isEmpty) return tr(LocaleKeys.filed_required);
            return null;
          },
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
          hintStyle: getMediumStyle(fontSize: 16.sp, color: AppColors.greyText),
          filled: true,
          fillColor: AppColors.primary.withOpacity(.05),
          enabledBorder: textFiledBorder.copyWith(
              borderSide: BorderSide(color: AppColors.grey)),
          border: textFiledBorder.copyWith(
              borderSide: BorderSide(color: AppColors.grey)),
          disabledBorder: textFiledBorder.copyWith(
              borderSide: BorderSide(color: AppColors.grey)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(8.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.all(AppPadding.p12.sp),
            child: InkWell(
              onTap: widget.icon == AppAssets.eye
                  ? () {
                      _showPassword();
                    }
                  : null,
              child: SvgPicture.asset(
                widget.icon ?? "",
                color: (!widget.obscureText && widget.icon == AppAssets.eye)
                    ? AppColors.primary
                    : AppColors.grey,
              ),
            ),
          ),
          hintText: widget.hintText),
    );
  }
}

final textFiledBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(8.r),
    borderSide: BorderSide(
      color: AppColors.grey,
    ));
