import 'package:flutter/material.dart';
import 'package:flutter_buybye/models/purchase_list.dart';
import 'package:flutter_buybye/models/purchase.dart';
import 'package:provider/provider.dart';
import 'models/purchase_list.dart' as purchase_list;
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
    late List purchaseItems = purchaseList.getDefaultItems();

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
                : ListView.builder(
                    itemCount: purchaseItems.length,
                    itemBuilder: (context, index) {
                      final item = purchaseItems[index];
                      return Dismissible(
                        key: ValueKey(item.product.id),
                        background: Container(
                          color: Theme.of(context).colorScheme.error,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          purchaseList.removeItem(item.product.id);
                        },
                        child: Card(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 4,
                          ),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: FittedBox(
                                  child: Text('${item.product.price.toStringAsFixed(0)}원'),
                                ),
                              ),
                            ),
                            title: Text(item.product.name),
                            subtitle: Text('총: ${(item.product.price * item.quantity).toStringAsFixed(0)}원'),
                            trailing: Text('${item.quantity}개'),
                          ),
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
                  color: Colors.grey.withValues(red: 128, green: 128, blue: 128, alpha: 51),
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
