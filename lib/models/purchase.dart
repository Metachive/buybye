import 'package:flutter_buybye/models/product.dart';

class Purchase {
  final Product product;
  int quantity;

  Purchase({
    required this.product,
    this.quantity = 1,
  });

  static List<Purchase> getDefaultItems() {
    return [
      Purchase(
        product: Product.fromType(ProductType.product1),
        quantity: 1,
      ),
      Purchase(
        product: Product.fromType(ProductType.product2),
        quantity: 2,
      ),
      Purchase(
        product: Product.fromType(ProductType.product3),
        quantity: 1,
      ),
    ];
  }

    Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
} 