import 'package:flutter/material.dart';
import 'package:flutter_buybye/models/cart.dart';
import 'package:intl/intl.dart';
import 'models/cart_list.dart';
import 'widgets/common_app_bar.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  final List<Cart> _cart = CartList().getDefaultItems();

  void _updateQuantity(int index, int newQuantity) {
    if (newQuantity < 1) return;
    setState(() {
      _cart[index].quantity = newQuantity;
    });
  }

  void _removeItem(int index) {
    setState(() {
      _cart.removeAt(index);
    });
  }

  int get _totalPrice {
    return _cart.fold(0, (sum, item) => sum + item.totalPrice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: const Text(
                    '장바구니',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back_ios, size: 16),
                ),
              ],
            ),
          ),
          Expanded(
            child: _cart.isEmpty
                ? const Center(
                    child: Text(
                      '장바구니에 상품이 없습니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: _cart.length,
                    itemBuilder: (context, index) {
                      final cartItem = _cart[index];
                      final product = cartItem.product;

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  product.imagePath,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            product.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.close,
                                                size: 20),
                                            onPressed: () =>
                                                _removeItem(index),
                                            padding: EdgeInsets.zero,
                                            constraints:
                                                const BoxConstraints(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300),
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(Icons.remove,
                                                      size: 14),
                                                  onPressed: () =>
                                                      _updateQuantity(
                                                          index,
                                                          cartItem.quantity -
                                                              1),
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Container(
                                                height: 24,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    cartItem.quantity
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Container(
                                                height: 24,
                                                width: 24,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors
                                                          .grey.shade300),
                                                ),
                                                child: IconButton(
                                                  icon: const Icon(Icons.add,
                                                      size: 14),
                                                  onPressed: () =>
                                                      _updateQuantity(
                                                          index,
                                                          cartItem.quantity +
                                                              1),
                                                  padding: EdgeInsets.zero,
                                                  constraints:
                                                      const BoxConstraints(),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16.0),
                                            child: Text(
                                              '${NumberFormat('#,###').format(cartItem.totalPrice)}원',
                                              style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (index < _cart.length - 1)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.grey.shade200,
                              ),
                            ),
                        ],
                      );
                    },
                  ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(red: 128, green: 128, blue: 128, alpha: 51),
                  spreadRadius: 1,
                  blurRadius: 4,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '총 결제금액',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '${NumberFormat('#,###').format(_totalPrice)}원',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // 구매 로직 작성
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    child: const Text(
                      '구매하기',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}