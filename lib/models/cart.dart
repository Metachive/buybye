import 'product.dart';

class Cart {
  final Product product;
  int quantity;

  Cart({
    required this.product,
    this.quantity = 0,
  });

  int get totalPrice => product.price * quantity;

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
} 