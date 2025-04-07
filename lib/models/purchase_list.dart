import 'package:flutter/material.dart';
import 'package:flutter_buybye/models/purchase.dart';

class PurchaseList extends ChangeNotifier {
  final List<Purchase> _items = [];

  int get itemCount => _items.length;

  List<Purchase> getDefaultItems() {
    return _items;
  }

  void addPurchases(List<Purchase> purchaseList) {
    for (var purchase in purchaseList) {
      _items.add(Purchase(
        product: purchase.product,
        quantity: purchase.quantity,
      ));
    }
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.product.id == id);
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}