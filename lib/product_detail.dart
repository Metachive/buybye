import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_buybye/models/product_type.dart';
import 'package:provider/provider.dart';
import 'package:flutter_buybye/shopping_cart.dart';
import 'package:intl/intl.dart';
import 'models/cart_list.dart';
import 'models/product_list.dart';
import 'widgets/common_app_bar.dart';

class ProductDetail extends StatefulWidget {
  final String productId;

  const ProductDetail({
    super.key,
    required this.productId,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1;

  void updateQuantity(int newQuantity) {
    setState(() {
      quantity = newQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductList>(context);
    final product = productList.getProductById(widget.productId);
    
    if (product == null) {
      return Scaffold(
        appBar: const CommonAppBar(),
        body: const Center(
          child: Text('상품을 찾을 수 없습니다.'),
        ),
      );
    }

    return Scaffold(
      appBar: const CommonAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: const Text(
                      '상품 상세',
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
            product.imagePath.startsWith('assets/')
                ? Image.asset(
                    product.imagePath,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  )
                : Image.file(
                    File(product.imagePath),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${NumberFormat('#,###').format(product.price)}원',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.remove, size: 16),
                          padding: EdgeInsets.zero,
                          onPressed: quantity > 1
                              ? () => updateQuantity(quantity - 1)
                              : null,
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Text(
                          quantity.toString(),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.add, size: 16),
                          padding: EdgeInsets.zero,
                          onPressed: () => updateQuantity(quantity + 1),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final cartList = Provider.of<CartList>(context, listen: false);
                            cartList.addItem(product as Product, quantity: quantity);
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('알림'),
                                  content: const Text('장바구니에 상품이 담겼습니다.'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('계속 쇼핑'),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              final cartList = Provider.of<CartList>(context, listen: false);
                                              cartList.addItem(product as Product, quantity: quantity);
                                              return const ShoppingCart();
                                            },
                                          ),
                                        );
                                      },
                                      child: const Text('장바구니로 이동'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '장바구니에 담기',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            final cartList = Provider.of<CartList>(context, listen: false);
                            cartList.addItem(product as Product, quantity: quantity);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const ShoppingCart()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
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
                  const SizedBox(height: 30),
                  Text(
                    product.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: null,
    );
  }
} 