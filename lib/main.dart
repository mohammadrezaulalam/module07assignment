import 'package:flutter/material.dart';
import 'screens/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ProductList(),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  List<Product> products = [
    Product(name: 'Samsung Galaxy S', price: 580.0),
    Product(name: 'Google Pixel 5', price: 450.0),
    Product(name: 'Realme 5i', price: 200.0),
    Product(name: 'Sony Xperia Z', price: 380.0),
    Product(name: 'Symphony Z60', price: 190.0),
    Product(name: 'Redmi Note 10', price: 275.0),
    Product(name: 'Oppo A12', price: 280.0),
    Product(name: 'Apple 14 Pro', price: 980.0),
    Product(name: 'LG K52', price: 530.0),
    Product(name: 'Google Pixel 7', price: 495.0),
    Product(name: 'Realme 8 Pro', price: 420.0),
    Product(name: 'Samsung M31', price: 340.0),
    Product(name: 'Oppo A17', price: 265.0),
  ];


  Map<String, int> productCount = {};

  void addToCart(Product product) {
    setState(() {
      if (productCount.containsKey(product.name)) {
        productCount[product.name] = productCount[product.name]! + 1;
      } else {
        productCount[product.name] = 1;
      }

      if (productCount[product.name] == 5) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Congratulations!'),
            content: Text('You\'ve bought 5 ${product.name}!'),
            actions: [
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      }
    });
  }

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
        title: const Text("Product List"),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index){
            final product = products[index];
            return Container(
              height: 100,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(product.name),
                ),

                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                trailing: FittedBox(
                  //fit: BoxFit.contain,
                  child: Column(
                    children: [
                      Text("Counter: ${productCount[product.name] ?? 0}"),
                      ElevatedButton(
                        onPressed: (){
                          addToCart(product);
                        },
                        child: const Text("Buy Now"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage(productCount)),);
        },
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.shopping_cart),
      ),
    );
  }
}
