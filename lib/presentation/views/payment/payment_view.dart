import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:labor/core/app_creditcard_formate.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../widgets/app_payment_item.dart';

class PaymentView extends StatelessWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.payment_payment),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppPadding.p20.sp),
              itemCount: CreditCardTypes.values.length,
              itemBuilder: (_, index) => AppPaymentItem(
                creditCardTypes: CreditCardTypes.values.toList()[index],
                cardNum: '1234567891234567',
                name: 'Abdul Aziz Al-Qahtany',
                dateExp:
                    'Valid Theu ${AppDateFormat.formatExpirationDate(DateTime.now())}',
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white),
            child: ElevatedButton.icon(
              icon: Icon(
                Icons.add,
                color: AppColors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, Routes.addCard);
              },
              label: Text(tr(LocaleKeys.payment_add_card)),
            ),
          )
        ],
      ),
    );
  }
}
