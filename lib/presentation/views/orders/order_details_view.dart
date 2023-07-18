import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/presentation/widgets/app_select_your_location.dart';

import '../../../translations/locale_keys.g.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({Key? key}) : super(key: key);

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.order_detalis_order_detalis),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        children: [
          Text(
            tr(LocaleKeys.order_detalis_my_order_detalis),
            style: getMediumStyle(
              fontSize: 18.sp,
            ),
          ),
          SizedBox(
            height: AppSize.s10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_name_of_order),
                subTitle: tr(LocaleKeys.categories_hourly_cleaning),
              ),
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_code_of_order),
                subTitle: '123455648fsx5a5sc4as',
              ),
            ],
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_company),
                subTitle: 'احمد الحريري',
              ),
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_date_of_order),
                subTitle: '${AppDateFormat.toDate(DateTime.now())}',
              ),
            ],
          ),

          ///
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_detalis_order),
                subTitle: '1 عاملة فلبينية بنظام الساعة 8 ساعات',
              ),
              AppOrderItem(
                title: tr(LocaleKeys.order_detalis_order_states),
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
          AppSelectYourLocation(
            onTap: () {},
            subTitle: 'جدة مدرسة الكسندر للغات المقاطعة 2',
          ),
          SizedBox(
            height: AppSize.s20,
          ),

          ///
          Text(tr(LocaleKeys.order_detalis_price),
              style: getMediumStyle(
                fontSize: 18.sp,
              )),
          SizedBox(
            height: AppSize.s20.sp,
          ),
          Container(
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
                    title: tr(LocaleKeys.order_detalis_price_order),
                    price: '2500 ريال '),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.order_detalis_tax),
                    price: '250 ريال '),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.order_detalis_discount),
                    price: '100 ريال ',
                    discount: true),

                ///
                _buildListTilePrice(
                    title: tr(LocaleKeys.order_detalis_total_price),
                    price: '2700 ريال '),
              ],
            ),
          ),
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

class AppOrderItem extends StatelessWidget {
  const AppOrderItem({
    super.key,
    required this.title,
    this.subTitle,
    this.child,
  });

  final String title;
  final String? subTitle;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListTile(
      dense: true,
      isThreeLine: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: getMediumStyle(fontSize: 12.sp, color: AppColors.greyText),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: AppPadding.p8.sp),
        child: subTitle == null
            ? child
            : Text(
                subTitle!,
                style: getMediumStyle(fontSize: 14.sp, color: AppColors.black),
              ),
      ),
    ));
  }
}
