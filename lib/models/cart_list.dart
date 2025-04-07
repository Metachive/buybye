import 'package:flutter/foundation.dart';
import 'package:flutter_buybye/models/cart.dart';
import 'package:flutter_buybye/models/product_type.dart';
import 'package:flutter_buybye/models/purchase.dart';
import 'package:flutter_buybye/models/purchase_list.dart';

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
        quantity: quantity,
      );
    } else {
      _items.add(Cart(
        product: product,
        quantity: quantity,
      ));
    }
    // notifyListeners();
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void updateQuantity(String productId, int quantity) {
    final index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _items[index] = Cart(
        product: _items[index].product,
        quantity: quantity,
      );
      notifyListeners();
    }
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }

  void removeAt(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }

  void purchase(PurchaseList purchaseList) {
    if (_items.isEmpty) return;
    
    final purchases = _items.map((cartItem) => Purchase(
      product: cartItem.product,
      quantity: cartItem.quantity,
    )).toList();
    
    purchaseList.addPurchases(purchases);
    
    // 상태 변경을 마이크로태스크 큐에 추가하여 빌드 과정 이후에 실행되도록 합니다.
    Future.microtask(() {
      clear();
    });
  }
}

class ProductItem {
  final Product product;
  final int quantity;

  ProductItem({
    required this.product,
    required this.quantity,
  });
} 