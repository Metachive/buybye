import 'package:flutter/foundation.dart';
import 'product.dart';

class ProductList with ChangeNotifier {
  List<Product> _products = [];

  ProductList() {
    _products = ProductType.values.map((type) => Product.fromType(type)).toList();
  }

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(String productId) {
    _products.removeWhere((product) => product.id == productId);
    notifyListeners();
  }

  Product? getProductById(String productId) {
    try {
      return _products.firstWhere((product) => product.id == productId);
    } catch (e) {
      return null;
    }
  }
} 