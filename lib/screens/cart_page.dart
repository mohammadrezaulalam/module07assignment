import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final Map<String, int> productCount;

  const CartPage(this.productCount, {super.key});

  int getTotalProductCount() {
    int totalCount = 0;
    productCount.forEach((_, count) {
      totalCount += count;
    });
    return totalCount;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Total Products: ${getTotalProductCount()}', style: const TextStyle(fontSize: 22),),
      ),
    );
  }
}