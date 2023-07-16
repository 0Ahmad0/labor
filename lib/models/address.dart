class Address {
  final String city;
  final String street;
  final String region;
  final String building;
  bool isSelect;

  Address(
      {required this.city,
      required this.street,
      required this.region,
      required this.building,
      this.isSelect = false});
}
