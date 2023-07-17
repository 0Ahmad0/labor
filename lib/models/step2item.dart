class Step2Item {
  final String companyLogo;
  final String companyName;
  final int companyRate;
  final double price;
  final String type;
  final String nationality;
  final String time;
  bool isSelected;

  Step2Item(
      {required this.companyLogo,
      required this.companyName,
      required this.companyRate,
      required this.price,
      required this.type,
      required this.nationality,
      required this.time,
      this.isSelected = false});
}
