import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:labor/models/notification.dart';
import 'package:labor/presentation/resources/app_assets.dart';
import 'package:labor/presentation/resources/app_colors.dart';
import 'package:labor/presentation/resources/app_constants.dart';
import 'package:labor/presentation/resources/app_styles.dart';
import 'package:labor/presentation/resources/app_values.dart';
import 'package:labor/presentation/widgets/app_notification_item.dart';

import '../../../translations/locale_keys.g.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  late final List<NotificationModel> _notifications;

  void _fillList() {
    _notifications = [
      NotificationModel(
          icon: AppAssets.completeNotify,
          title: tr(LocaleKeys.notification_confirmed),
          subTitle: 'Your order is Done \n register payment methods',
          time: '2hr',
          notificatioType: NotificationType.confirmed),
      NotificationModel(
          icon: AppAssets.reminderNotify,
          title: tr(LocaleKeys.notification_reminder),
          subTitle: 'House Shifting - #2F33J \n scheduled Tomorrow.',
          time: 'yesterday',
          notificatioType: NotificationType.reminder),
      NotificationModel(
          icon: AppAssets.canceledNotify,
          title: tr(LocaleKeys.notification_canceled),
          subTitle: 'Your order is Canceled \n Try Again',
          time: '4hr',
          notificatioType: NotificationType.cancel),
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
          tr(LocaleKeys.notification_notification),
          style: getBoldStyle(fontSize: 18.sp, color: AppColors.black),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(AppPadding.p20.sp),
        itemCount: _notifications.length,
        itemBuilder: (_, index) {
          final item = _notifications[index];
          return AppNotificationItem(
            icon: item.icon,
            title: item.title,
            subTitle: item.subTitle,
            time: item.time,
            notificationType: item.notificatioType,
          );
        },
      ),
    );
  }
}
