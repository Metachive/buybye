import 'package:flutter/material.dart';
import 'package:flutter_buybye/product_register.dart';
import 'models/product.dart';
import 'package:intl/intl.dart';
import 'product_detail.dart';
import 'widgets/common_app_bar.dart';
import 'package:provider/provider.dart';
import 'models/product_list.dart';
import 'dart:io';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<ProductList>(context);
    final products =
        productList.products.isEmpty
            ? ProductType.values.map((type) => Product.fromType(type)).toList()
            : productList.products;

    return Scaffold(
      appBar: const CommonAppBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              '상품 리스트',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => ProductDetail(productId: product.id),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio: 1.2,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child:
                              product.imagePath.startsWith('assets/')
                                  ? Image.asset(
                                    product.imagePath,
                                    fit: BoxFit.cover,
                                  )
                                  : Image.file(
                                    File(product.imagePath),
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product.name,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${NumberFormat('#,###').format(product.price)}원',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProductRegister()),
          );
        },
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/plus.png', width: 24, height: 24),
      ),
    );
  }
}
