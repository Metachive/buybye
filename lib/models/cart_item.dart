import 'product.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });

  int get totalPrice => product.price * quantity;

  static List<CartItem> getDefaultItems() {
    return [
      CartItem(
        product: Product.fromType(ProductType.product1),
        quantity: 1,
      ),
      CartItem(
        product: Product.fromType(ProductType.product2),
        quantity: 2,
      ),
      CartItem(
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

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }
} 