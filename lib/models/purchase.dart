import 'cart_item.dart';

class Purchase {
  final String id;
  final List<CartItem> items;
  final DateTime purchaseDate;
  final int totalAmount;
  final String status; // 'pending', 'completed', 'cancelled'

  Purchase({
    required this.id,
    required this.items,
    required this.purchaseDate,
    required this.totalAmount,
    this.status = 'pending',
  });

  int get itemCount => items.length;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'purchaseDate': purchaseDate.toIso8601String(),
      'totalAmount': totalAmount,
      'status': status,
    };
  }

  factory Purchase.fromJson(Map<String, dynamic> json) {
    return Purchase(
      id: json['id'],
      items: (json['items'] as List)
          .map((item) => CartItem.fromJson(item))
          .toList(),
      purchaseDate: DateTime.parse(json['purchaseDate']),
      totalAmount: json['totalAmount'],
      status: json['status'],
    );
  }

  Purchase copyWith({
    String? id,
    List<CartItem>? items,
    DateTime? purchaseDate,
    int? totalAmount,
    String? status,
  }) {
    return Purchase(
      id: id ?? this.id,
      items: items ?? this.items,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
    );
  }
} 