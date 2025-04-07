import 'dart:io';
import 'package:flutter/material.dart';
import 'models/product.dart'; // 더미 product 객체가 있다고 가정

class ProductDetail extends StatelessWidget {
  final Product product;
  final int quantity;

  const ProductDetail({super.key, required this.product, this.quantity = 1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('상품 상세')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 상단 제목 + 뒤로가기 버튼 (비작동)
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
                  const Icon(Icons.arrow_back_ios, size: 16),
                ],
              ),
            ),

            // 상품 이미지
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

            // 상품 정보
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
                    '${product.price}원', // 포맷 제거
                    style: const TextStyle(fontSize: 20, color: Colors.black),
                  ),

                  // 수량 조절 버튼 (비작동)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Icon(Icons.remove, size: 16),
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
                        child: const Icon(Icons.add, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 버튼 영역 (비작동)
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '장바구니에 담기',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            '구매하기',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 상품 설명
                  Text(
                    product.description,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
