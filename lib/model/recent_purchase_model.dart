class RecentPurchase {
  final String sl;
  final String date;
  final String invoice;
  final String brand;
  final String category;
  final String product;
  final String purchase;
  final String due;
  final bool isPaid;

  const RecentPurchase({
    required this.sl,
    required this.date,
    required this.invoice,
    required this.brand,
    required this.category,
    required this.product,
    required this.purchase,
    required this.due,
    required this.isPaid,
  });
}
