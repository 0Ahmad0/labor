import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/core/app_validator.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';

import '../../../translations/locale_keys.g.dart';
import '../../resources/app_values.dart';
import '../../widgets/app_dropdown_button_form_filed.dart';
import '../../widgets/app_textform_filed.dart';

class AddCardView extends StatefulWidget {
  const AddCardView({Key? key}) : super(key: key);

  @override
  State<AddCardView> createState() => _AddCardViewState();
}

class _AddCardViewState extends State<AddCardView> {
  final cardNameController =
      TextEditingController(text: 'Abdul Aziz Al-Qahtany');
  final cardTypeController = TextEditingController(text: 'Visa');
  final cardNumController = TextEditingController();
  final cardExpDateController = TextEditingController();
  final cardCvvController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        cardExpDateController.text = AppDateFormat.formatExpirationDate(picked);
        ;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            tr(LocaleKeys.add_card_add_card),
            style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
          )),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          children: [
            Text(
              tr(LocaleKeys.add_card_card_name),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              controller: cardNameController,
              hintText: tr(LocaleKeys.add_card_card_name),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.add_card_card_type),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppDropDownButtonFormFiled(
              controller: cardTypeController,
              items: [
                "Visa",
                "Mastercard",
                "American Express",
                "Discover",
                "Diners Club",
                "JCB",
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
            Text(
              tr(LocaleKeys.add_card_card_num),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              validator: (value) => AppValidator.validateCardNumber(value),
              controller: cardNumController,
              hintText: tr(LocaleKeys.add_card_card_num),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.add_card_exp_date),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              readOnly: true,
              onTap: () {
                _selectDate(context);
              },
              controller: cardExpDateController,
              hintText: tr(LocaleKeys.add_card_exp_date),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.datetime,
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              tr(LocaleKeys.add_card_cvv),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
            SizedBox(
              height: AppSize.s10.sp,
            ),
            AppTextFiled(
              validator: (value) => AppValidator.validateCvv(value),
              controller: cardCvvController,
              hintText: tr(LocaleKeys.add_card_cvv),
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
                  tr(LocaleKeys.add_card_save),
                  style: getBoldStyle(fontSize: 18.sp),
                ))
          ],
        ),
      ),
    );
  }
}
