import '../presentation/resources/app_constants.dart';

class HistoryItem {
  final String type;
  final String status;
  final String id;
  final String image;
  final String companyName;
  final String date;
  final double price;
  final StatusHistoryItem statusHistoryItem;
  final int rate;
  final String description;

  HistoryItem({
    required this.type,
    required this.status,
    required this.id,
    required this.image,
    required this.companyName,
    required this.date,
    required this.price,
    required this.statusHistoryItem,
    required this.rate,
    required this.description,
  });
}
