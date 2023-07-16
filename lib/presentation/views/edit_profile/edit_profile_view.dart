import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../resources/app_assets.dart';
import '../../resources/app_routes.dart';
import '../../resources/app_values.dart';
import '../../widgets/app_textform_filed.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final nameController = TextEditingController(text: 'Abdul Aziz Al-Qahtany');
  final phoneController = TextEditingController(text: '5621458751');
  final passwordController = TextEditingController(text: '123456789');
  final _formKey = GlobalKey<FormState>();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.edit_profile_edit_profile),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            GestureDetector(
              onTap: () async {
                ImagePicker picker = ImagePicker();
                final result =
                    await picker.pickImage(source: ImageSource.gallery);
                if (result != null) {
                  setState(() {
                    _image = File(result.path);
                  });
                }
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(AppPadding.p20.sp),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: _image == null
                          ? Image.asset(
                              width: 90.sp,
                              height: 90.sp,
                              AppAssets.logoApp,
                              fit: BoxFit.fill,
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(12.r),
                              child: Image.file(
                                width: 90.sp,
                                height: 90.sp,
                                _image!,
                                fit: BoxFit.fill,
                              )),
                    ),
                    Container(
                      width: 90.sp,
                      height: 90.sp,
                      decoration: BoxDecoration(
                        color: AppColors.black.withOpacity(.4),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Icon(
                        Icons.photo_camera_outlined,
                        color: AppColors.white,
                        size: 40.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.edit_profile_full_name),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              icon: AppAssets.user,
              controller: nameController,
              hintText: tr(LocaleKeys.edit_profile_full_name),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.edit_profile_phone),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              icon: AppAssets.phone,
              controller: phoneController,
              hintText: tr(LocaleKeys.edit_profile_phone),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.edit_profile_password),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              obscureText: true,
              icon: AppAssets.eye,
              controller: passwordController,
              hintText: tr(LocaleKeys.edit_profile_password),
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {}
              },
              child: Text(
                tr(LocaleKeys.edit_profile_save_changes),
                style: getBoldStyle(fontSize: 18.sp),
              ),
            ),
            SizedBox(
              height: AppSize.s40.sp,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: AppMargin.m40.sp),
              child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: AppColors.error.withOpacity(0.1),
                  ),
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    AppAssets.deleteAccount,
                  ),
                  label: Text(
                    tr(LocaleKeys.edit_profile_delete_account),
                    style:
                        getBoldStyle(fontSize: 16.sp, color: AppColors.black),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
