import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'widgets/common_app_bar.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시 데이터 (뷰 확인용)
    final purchaseItems = [
      {
        'imagePath': 'assets/sample1.jpg',
        'name': '샘플 상품 A',
        'quantity': 2,
        'price': 15000,
      },
      {
        'imagePath': 'assets/sample2.jpg',
        'name': '샘플 상품 B',
        'quantity': 1,
        'price': 20000,
      },
    ];

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: const [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    '구매리스트',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: purchaseItems.isEmpty
                ? const Center(
                    child: Text(
                      '구매 내역이 없습니다.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.separated(
                    itemCount: purchaseItems.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.0),
                      child: Divider(color: Colors.grey),
                    ),
                    itemBuilder: (context, index) {
                      final item = purchaseItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item['imagePath']!,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['name']!,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${item['quantity']}개',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '${NumberFormat('#,###').format(item['price'])}원',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
            child: const SizedBox(), // 향후 하단 버튼이나 정보 추가 가능
          ),
        ],
      ),
    );
  }
}
