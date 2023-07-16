import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_routes.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../../models/address.dart';
import '../../widgets/app_select_address_item.dart';

class SelectAddressView extends StatefulWidget {
  const SelectAddressView({Key? key}) : super(key: key);

  @override
  State<SelectAddressView> createState() => _SelectAddressViewState();
}

class _SelectAddressViewState extends State<SelectAddressView> {
  late final List<Address> _addresses;

  _fillList() {
    _addresses = [
      Address(
          city: 'Riyadh',
          street: 'Non',
          region: 'Alexander Language School',
          building: '2 Floor',
          isSelect: false),
      Address(
          city: 'Riyadh',
          street: 'Non',
          region: 'Alexander Language School',
          building: '2 Floor',
          isSelect: false),
      Address(
          city: 'Riyadh',
          street: 'Non',
          region: 'Alexander Language School',
          building: '2 Floor',
          isSelect: true),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          tr(LocaleKeys.select_address_select_address),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.address);
            },
            icon: Icon(Icons.add_circle_outline),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            itemCount: _addresses.length,
            itemBuilder: (_, index) {
              final item = _addresses[index];
              return AppSelectAddressItem(
                address: item,
              );
            },
          )),
          Container(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            width: double.infinity,
            decoration: BoxDecoration(color: AppColors.white),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(tr(LocaleKeys.select_address_select)),
            ),
          )
        ],
      ),
    );
  }
}
