import 'package:flutter/material.dart';

import 'detailedpage.dart';

class ProductList extends StatelessWidget {
  final dynamic category;

  ProductList({required this.category});

  @override
  Widget build(BuildContext context) {
    // Get the list of products for the selected category
    final productList = category['products'];

    return Scaffold(
      appBar: AppBar(
        title: Text('${category['name']} Products'),
      ),
      body: productList.isEmpty
          ? Center(child: Text('No products available in this category.'))
          : ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(product['product_name'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price: ₹${product['price']}'),
                  Text('Wholesale Price: ₹${product['wholesale_price']}'),
                  Text('Min Order: ${product['minimum_order_quantity']}'),
                ],
              ),
              leading: Image.network(product['image'], width: 50, height: 50, fit: BoxFit.cover),
              onTap: () {
                // Navigate to the product details page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}