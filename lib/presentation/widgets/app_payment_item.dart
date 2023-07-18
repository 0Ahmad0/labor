import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:labor/presentation/resources/app_constants.dart';

import '../../core/app_creditcard_formate.dart';
import '../../core/app_data_formate.dart';
import '../resources/app_assets.dart';
import '../resources/app_colors.dart';
import '../resources/app_styles.dart';
import '../resources/app_values.dart';

class AppPaymentItem extends StatelessWidget {
  const AppPaymentItem({
    super.key,
    this.creditCardTypes = CreditCardTypes.visa,
    required this.cardNum,
    required this.name,
    required this.dateExp,
    this.margin = 60,
  });

  final CreditCardTypes creditCardTypes;
  final String cardNum;
  final String name;
  final String dateExp;
  final double margin;

  String _getIcon(CreditCardTypes creditCardTypes) {
    switch (creditCardTypes) {
      case CreditCardTypes.americanExpress:
        return AppAssets.americanExpress;
      case CreditCardTypes.dinersClub:
        return AppAssets.dinersClub;
      case CreditCardTypes.elo:
        return AppAssets.elo;
      case CreditCardTypes.hiper:
        return AppAssets.hiper;
      case CreditCardTypes.jcb:
        return AppAssets.jcb;
      case CreditCardTypes.maestro:
        return AppAssets.maestro;
      case CreditCardTypes.masterCard:
        return AppAssets.masterCard;
      case CreditCardTypes.mirPay:
        return AppAssets.mirPay;
      case CreditCardTypes.unionPay:
        return AppAssets.unionPay;
      case CreditCardTypes.visa:
        return AppAssets.visa;
      default:
        return AppAssets.visa;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: margin.sp),
      padding: EdgeInsets.all(AppPadding.p20.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            24.r,
          ),
          gradient: LinearGradient(colors: AppColors.creditCardGradient)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  _getIcon(creditCardTypes),
                  width: 80.sp,
                  height: 80.sp,
                ),
                SvgPicture.asset(AppAssets.cardGold)
              ],
            ),
            SizedBox(
              height: AppSize.s20.sp,
            ),
            Text(
              AppCreditCard.maskCreditCardNumber('1234567891234567'),
              style: getBoldStyle(fontSize: 14.sp, color: AppColors.white),
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Abdul Aziz Al-Qahtany',
                style: getBoldStyle(fontSize: 12.sp),
              ),
              trailing: Text(
                'Valid Thru  ${AppDateFormat.formatExpirationDate(
                  DateTime.now(),
                )}',
                style: getBoldStyle(fontSize: 12.sp, color: AppColors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
