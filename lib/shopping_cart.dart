import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/common_app_bar.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({super.key});

  @override
  Widget build(BuildContext context) {
    // 더미 데이터
    final cartItems = [
      {
        'name': '샘플 상품 1',
        'imagePath': 'assets/sample1.jpg',
        'quantity': 2,
        'totalPrice': 30000,
      },
      {
        'name': '샘플 상품 2',
        'imagePath': 'assets/sample2.jpg',
        'quantity': 1,
        'totalPrice': 15000,
      },
    ];

    final totalAmount =
        cartItems.fold(0, (sum, item) => sum + (item['totalPrice'] as int));

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                  child: Text(
                    '장바구니',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
            child: cartItems.isEmpty
                ? const Center(
                    child: Text(
                      '장바구니에 상품이 없습니다.',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      final item = cartItems[index];

                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  item['imagePath']!,
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
                                            item['name']!,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Icon(Icons.close, size: 20),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              _quantityBox(Icons.remove),
                                              const SizedBox(width: 4),
                                              Container(
                                                height: 24,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: Colors.grey.shade300),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '${item['quantity']}',
                                                    style:
                                                        const TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              _quantityBox(Icons.add),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 16.0),
                                            child: Text(
                                              '${NumberFormat('#,###').format(item['totalPrice'])}원',
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
                          if (index < cartItems.length - 1)
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
                  color: Colors.grey.withOpacity(0.2),
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
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        '총 결제금액',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        '${NumberFormat('#,###').format(totalAmount)}원',
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          title: Text('구매 완료'),
                          content: Text('구매가 완료되었습니다.'),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '구매하기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
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

  Widget _quantityBox(IconData icon) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Icon(icon, size: 14),
    );
  }
}