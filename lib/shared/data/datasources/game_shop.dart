import 'package:crazy_granny/shared/data/models/models.dart';

class GameShop {
  static final List<ShopItem> grannyItems = [
    ShopItem(
      id: 0,
      name: "Grandma's slippers",
      asset: 'assets/images/shoes_circle.png',
      price: 50,
    ),
    ShopItem(
      id: 1,
      name: "Flowers in a clay pot",
      asset: 'assets/images/flowers_circle.png',
      price: 50,
    ),
    ShopItem(
      id: 2,
      name: "A stack of old books",
      asset: 'assets/images/books_circle.png',
      price: 50,
    ),
    ShopItem(
      id: 3,
      name: "Skein of thread",
      asset: 'assets/images/needles_circle.png',
      price: 50,
    ),
  ];

  static final List<GameCurrency> gameCurrencies = [
    GameCurrency(
      id: 0,
      quantity: 50000,
      price: 2.99,
      bestPrice: true,
      priceString: '2,99',
      quantityString: '50 000',
    ),
    GameCurrency(
      id: 1,
      quantity: 50000,
      price: 1.99,
      priceString: '1,99',
      quantityString: '25 000',
    ),
    GameCurrency(
      id: 2,
      quantity: 50000,
      price: 0.99,
      priceString: '0,99',
      quantityString: '10 000',
    ),
  ];
}
