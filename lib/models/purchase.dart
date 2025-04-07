import 'models/product_type.dart';

class Purchase {
  final Product product;
  int quantity;

  Purchase({
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

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  void call() {
    // call 메서드 구현
  }
}