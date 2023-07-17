import 'package:country_picker/country_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../models/period.dart';
import '../../../../translations/locale_keys.g.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_styles.dart';
import '../../../resources/app_values.dart';

class Step3 extends StatefulWidget {
  const Step3({
    super.key,
  });

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  int _selectedIndex = 0;
  late final List<Period> _periods;
  final numberHoursController = TextEditingController(text: "1");
  final nationalityController = TextEditingController(text: '🇸🇾');
  final cityController = TextEditingController(text: "Riadh");

  _fillList() {
    _periods = [
      Period(name: tr(LocaleKeys.make_order_morning), icon: AppAssets.sun),
      Period(name: tr(LocaleKeys.make_order_night), icon: AppAssets.night),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(AppPadding.p20.sp),
            children: [],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          width: double.infinity,
          decoration: BoxDecoration(color: AppColors.white),
          child: ElevatedButton(
              onPressed: () {},
              child: Text(
                tr(LocaleKeys.make_order_next),
                style: getBoldStyle(fontSize: 16.sp),
              )),
        )
      ],
    );
  }
}
