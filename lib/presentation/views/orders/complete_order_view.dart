import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_constants.dart';

import '../../../core/app_data_formate.dart';
import '../../../translations/locale_keys.g.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_styles.dart';
import '../../resources/app_values.dart';
import '../../widgets/app_order_item.dart';
import '../../widgets/app_payment_item.dart';
import '../../widgets/app_select_your_location.dart';
import '../../widgets/app_textform_filed.dart';

class CompleteOrderView extends StatefulWidget {
  const CompleteOrderView({Key? key}) : super(key: key);

  @override
  State<CompleteOrderView> createState() => _CompleteOrderViewState();
}

class _CompleteOrderViewState extends State<CompleteOrderView> {
  final noteController = TextEditingController();
  final coponController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.complete_order_complete_order),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: AppPadding.p20.sp),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            child: Text(
              tr(LocaleKeys.complete_order_my_order_detalis),
              style: getMediumStyle(
                fontSize: 18.sp,
              ),
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_name_of_order),
                subTitle: tr(LocaleKeys.categories_hourly_cleaning),
              ),
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_code_of_order),
                subTitle: '123455648fsx5a5sc4as',
              ),
            ],
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_company),
                subTitle: 'احمد الحريري',
              ),
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_date_of_order),
                subTitle: '${AppDateFormat.toDate(DateTime.now())}',
              ),
            ],
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_detalis_order),
                subTitle: '1 عاملة فلبينية بنظام الساعة 8 ساعات',
              ),
              AppOrderItem(
                title: tr(LocaleKeys.complete_order_order_states),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                      horizontal: AppPadding.p20.sp,
                      vertical: AppPadding.p10.sp),
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Text(
                    'تمت الموافقة',
                    overflow: TextOverflow.ellipsis,
                    style:
                        getMediumStyle(fontSize: 12.sp, color: AppColors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppSize.s20,
          ),

          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            child: AppSelectYourLocation(
              onTap: () {},
              subTitle: 'جدة مدرسة الكسندر للغات المقاطعة 2',
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),

          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            child: Text(tr(LocaleKeys.complete_order_payment_methods),
                style: getMediumStyle(
                  fontSize: 18.sp,
                )),
          ),
          SizedBox(
            height: AppSize.s10.sp,
          ),
          PaymentMethod(),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            child: AppPaymentItem(
              margin: 20,
              creditCardTypes: CreditCardTypes.values.toList()[0],
              cardNum: '1234567891234567',
              name: 'Abdul Aziz Al-Qahtany',
              dateExp:
                  'Valid Theu ${AppDateFormat.formatExpirationDate(DateTime.now())}',
            ),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline,
              color: AppColors.primary,
            ),
            label: Text(
              tr(LocaleKeys.complete_order_add_new_card),
              style: getMediumStyle(
                fontSize: 18.sp,
                color: AppColors.primary,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Text(
              tr(LocaleKeys.complete_order_leave_notes),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: AppSize.s10.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Form(
              key: _formKey,
              child: AppTextFiled(
                minline: AppConstants.minLineContactUsTextFiled,
                maxline: AppConstants.maxLineContactUsTextFiled,
                controller: noteController,
                hintText: tr(LocaleKeys.complete_order_your_notes),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),

          SizedBox(
            height: AppSize.s20.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: Text(
              tr(LocaleKeys.complete_order_add_cobon),
              style: getSemiBoldStyle(fontSize: 16.sp),
            ),
          ),
          SizedBox(
            height: AppSize.s10.sp,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20),
            child: AppTextFiled(
              iconData: Icon(
                Icons.check_circle,
                color: AppColors.primary,
              ),
              controller: coponController,
              hintText: tr(LocaleKeys.complete_order_add_cobon),
              textInputAction: TextInputAction.done,
            ),
          ),

          SizedBox(
            height: AppSize.s20.sp,
          ),

          ///
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            child: Text(tr(LocaleKeys.complete_order_price),
                style: getMediumStyle(
                  fontSize: 18.sp,
                )),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(
                color: AppColors.lightGreen,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                      color: AppColors.black.withOpacity(.05),
                      blurRadius: 8.sp,
                      offset: Offset(0, 4.sp))
                ]),
            child: Column(
              children: [
                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.complete_order_price_order),
                    price: '2500 ريال '),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.complete_order_tax),
                    price: '250 ريال '),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.complete_order_discount),
                    price: '100 ريال ',
                    discount: true),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.complete_order_total_price),
                    price: '2700 ريال '),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Padding(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text(
                  tr(LocaleKeys.complete_order_pay),
                  style: getBoldStyle(fontSize: 16.sp),
                )),
          )
        ],
      ),
    );
  }

  ListTile _buildListTilePrice(
      {required String title, required String price, bool discount = false}) {
    return ListTile(
      title: Text(
        title,
        style: getRegularStyle(
            fontSize: 14.sp, color: discount ? AppColors.primary : null),
      ),
      trailing: Text(
        price,
        style: getMediumStyle(
            fontSize: 16.sp, color: discount ? AppColors.primary : null),
      ),
    );
  }
}

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({
    super.key,
  });

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedIndex = 0;

  late final List<String> _paymentsMethods;

  @override
  void initState() {
    super.initState();
    _paymentsMethods = [
      tr(
        LocaleKeys.complete_order_debit_card,
      ),
      tr(
        LocaleKeys.complete_order_cash,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: AppColors.lightGreen,
      child: Row(
        children: List.generate(_paymentsMethods.length, (index) {
          return Expanded(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p10.sp),
                child: Column(
                  children: [
                    Text(
                      _paymentsMethods[index],
                      style: getMediumStyle(
                          color: _selectedIndex == index
                              ? AppColors.black
                              : AppColors.greyText),
                    ),
                    if (_selectedIndex == index)
                      Container(
                        margin: EdgeInsets.only(top: AppMargin.m8.sp),
                        width: AppSize.s10.sp,
                        height: 4.sp,
                        decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(100.r)),
                      )
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
