import 'package:labor/presentation/resources/app_constants.dart';

class NotificationModel {
  final String icon;
  final String title;
  final String subTitle;
  final String time;
  final NotificationType notificatioType;

  NotificationModel({
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.time,
    required this.notificatioType,
  });
}
