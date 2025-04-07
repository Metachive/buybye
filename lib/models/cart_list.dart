import 'package:flutter/foundation.dart';
import 'package:flutter_buybye/models/cart.dart';
import 'product.dart';

class CartList with ChangeNotifier {
  final List<Cart> _items = [];

  int get itemCount => _items.length;

  List<Cart> getDefaultItems() {
    return _items;
  }

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void addItem(Product product, {int quantity = 1}) {
    final existingItemIndex = _items.indexWhere((item) => item.product.id == product.id);
    
    if (existingItemIndex >= 0) {
      _items[existingItemIndex] = Cart(
        product: product,
        quantity: _items[existingItemIndex].quantity + quantity,
      );
    } else {
      _items.add(Cart(
        product: product,
        quantity: quantity,
      ));
    }
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index] = Cart(
        product: Product.fromType(ProductType.values[index]),
        quantity: quantity,
      );
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void removeAt(int index) {}
}

class ProductItem {
  final Product product;
  final int quantity;

  ProductItem({
    required this.product,
    required this.quantity,
  });
} 