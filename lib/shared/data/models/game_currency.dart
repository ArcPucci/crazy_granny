class GameCurrency {
  final int id;
  final bool bestPrice;
  final int quantity;
  final double price;
  final String priceString;
  final String quantityString;

  GameCurrency({
    required this.id,
    this.bestPrice = false,
    required this.quantity,
    required this.price,
    required this.priceString,
    required this.quantityString,
  });
}
