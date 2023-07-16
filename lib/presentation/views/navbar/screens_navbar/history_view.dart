import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:labor/core/app_data_formate.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/presentation/widgets/app_history_item.dart';
import 'package:labor/translations/locale_keys.g.dart';

import '../../../../models/historyItem.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  late final List<String> _tabsHistory;
  late final List<HistoryItem> _itemsOngoing;
  late final List<HistoryItem> _itemsPrevious;

  void _fillList() {
    _tabsHistory = [
      tr(LocaleKeys.history_ongoing),
      tr(LocaleKeys.history_previous),
    ];
    _itemsOngoing = [
      HistoryItem(
          type: 'contract cleaning',
          status: tr(LocaleKeys.history_accept),
          id: '25ds458126fs5dha',
          image: '',
          companyName: 'United Group Company',
          date: AppDateFormat.toDate(DateTime.now()),
          price: 1500,
          statusHistoryItem: StatusHistoryItem.accept,
          rate: 5,
          description: '1 Filipino worker under contract'),
      HistoryItem(
          type: 'contract cleaning',
          status: tr(LocaleKeys.history_in_review),
          id: '25ds458126fs5dha',
          image: '',
          companyName: 'Nile Company',
          date: AppDateFormat.toDate(DateTime.now()),
          price: 1500,
          statusHistoryItem: StatusHistoryItem.inReview,
          rate: 4,
          description: '1 Filipino worker under contract')
    ];
    _itemsPrevious = [
      HistoryItem(
          type: 'contract cleaning',
          status: tr(LocaleKeys.history_done),
          id: '25ds458126fs5dha',
          image: '',
          companyName: 'United Group Company',
          date: AppDateFormat.toDate(DateTime.now()),
          price: 1500,
          statusHistoryItem: StatusHistoryItem.done,
          rate: 2,
          description: '1 Filipino worker under contract'),
      HistoryItem(
          type: 'contract cleaning',
          status: tr(LocaleKeys.history_cancel),
          id: '25ds458126fs5dha',
          image: '',
          companyName: 'Nile Company',
          date: AppDateFormat.toDate(DateTime.now()),
          price: 1500,
          statusHistoryItem: StatusHistoryItem.cancel,
          rate: 1,
          description: '1 Filipino worker under contract')
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    return 'Data loaded successfully';
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: AppConstants.historyTabBarLength,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            tr(LocaleKeys.history_history),
            style: getBoldStyle(
              fontSize: 18.sp,
              color: AppColors.black,
            ),
          ),
          bottom: TabBar(
            labelColor: AppColors.black,
            unselectedLabelColor: AppColors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              borderRadius: BorderRadius.circular(50.r),
              borderSide: BorderSide(
                width: 4.0,
                color: AppColors.primary,
              ),
              insets: EdgeInsets.symmetric(
                horizontal: 24.sp,
                vertical: 4.sp,
              ),
            ),
            tabs: _tabsHistory
                .map((e) => Tab(
                      child: Text(
                        e,
                        style: getSemiBoldStyle(fontSize: 16.sp),
                      ),
                    ))
                .toList(),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppPadding.p20.sp),
          child: FutureBuilder<String>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Show a loading indicator while waiting for data
                return Center(child: SvgPicture.asset(AppAssets.noHistory));
              } else if (snapshot.hasError) {
                // Show an error message if data couldn't be loaded
                return Text('Error: ${snapshot.error}');
              } else {
                // Show the data after the delay
                return TabBarView(
                  children: [
                    ListView.builder(
                      itemCount: _itemsOngoing.length,
                      itemBuilder: (_, index) {
                        final item = _itemsOngoing[index];
                        return AppHistoryItem(
                            type: item.type,
                            statusHistoryItem: item.statusHistoryItem,
                            status: item.status,
                            id: item.id,
                            image: item.image,
                            companyName: item.companyName,
                            date: item.date,
                            price: item.price,
                            rate: item.rate,
                            description: item.description);
                      },
                    ),
                    ListView.builder(
                      itemCount: _itemsPrevious.length,
                      itemBuilder: (_, index) {
                        final item = _itemsPrevious[index];
                        return AppHistoryItem(
                            type: item.type,
                            statusHistoryItem: item.statusHistoryItem,
                            status: item.status,
                            id: item.id,
                            image: item.image,
                            companyName: item.companyName,
                            date: item.date,
                            price: item.price,
                            rate: item.rate,
                            description: item.description);
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
