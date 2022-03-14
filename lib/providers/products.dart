import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoriteStatus() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}

class Products with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: '1',
      title: 'OPPO Reno 6',
      description: 'Aurora Dual Sim 8GB RAM 128GB 4G LTE.',
      price: 6490.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1631093444/N50667559A_1.jpg',
    ),
    Product(
      id: '2',
      title: 'iPhone 13',
      description: 'iPhone 13 128GB Blue 5G With FaceTime.',
      price: 15900.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1637671943/N50838836A_2.jpg',
    ),
    Product(
      id: '3',
      title: 'OPPO A74  ',
      description: 'Dual SIM Prism Black 6GB RAM 128GB 4G LTE.',
      price: 4790.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1617859794/N46287989A_1.jpg',
    ),
    Product(
      id: '4',
      title: 'Xiaomi Redmi 9C',
      description: 'Dual SIM Purple 4GB RAM 128GB 4G LTE.',
      price: 2799.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1641144766/N52336732A_1.jpg',
    ),
    Product(
      id: '5',
      title: 'Xiaomi Redmi Note 11',
      description: '6GB RAM 128GB Lte Graphite Grey.',
      price: 3949.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1643637011/N52513388A_1.jpg',
    ),
    Product(
      id: '6',
      title: 'Samsung Galaxy A52s',
      description: '5G Dual SIM Awesome Black 8GB RAM 128GB.',
      price: 6699.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1629953276/N50099853A_2.jpg',
    ),
    Product(
      id: '7',
      title: 'Realme 9',
      description: 'Dual SIM 4GB RAM 128G ROM 4G LTE Prism Blue.',
      price: 3749.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1644494245/N52513392A_1.jpg',
    ),
    Product(
      id: '8',
      title: 'Xiaomi 11T Pro',
      description: 'Dual SIM Meteorite Gray 12GB RAM 256GB 5G.',
      price: 11899.00,
      imageUrl:
          'https://z.nooncdn.com/products/tr:n-t_80/v1635954118/N51707948A_3.jpg',
    ),
  ];

  List<Product> get items => List.of(_items);

  List<Product> get favoriteItems =>
      _items.where((item) => item.isFavorite).toList();

  Product findById(String id) =>
      _items.firstWhere((product) => product.id == id);
}
