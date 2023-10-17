class DonationType {
  final String type;
  final String defaultPay;
  bool isChecked;

  DonationType({
    required this.type,
    required this.defaultPay,
    this.isChecked = false,
  });
}