import 'package:flutter/material.dart';
import 'package:flutter_buybye/models/purchase_list.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'widgets/common_app_bar.dart';

class PurchaseHistory extends StatefulWidget {
  const PurchaseHistory({super.key});

  @override
  State<PurchaseHistory> createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseHistory> {
  @override
  Widget build(BuildContext context) {
    final purchaseList = Provider.of<PurchaseList>(context);
    final purchaseItems = purchaseList.getDefaultItems();

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
                      final purchase = purchaseItems[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                purchase.product.imagePath,
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
                                    purchase.product.name,
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
                                        '${purchase.quantity}개',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        '${NumberFormat('#,###').format(purchase.product.price)}원',
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
