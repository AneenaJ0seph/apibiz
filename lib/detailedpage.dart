import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  final dynamic product;

  ProductDetail({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['product_name']),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Center(
              child: Image.network(
                product['image'],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),

            // Product name
            Text(
              product['product_name'],
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),

            // Product description
            Text(
              product['product_details'],
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 16.0),

            // Product price and other details
            Text('Price: ₹${product['price']}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Text('Wholesale Price: ₹${product['wholesale_price']}',
                style: TextStyle(fontSize: 16)),
            SizedBox(height: 8.0),
            Text('Minimum Order Quantity: ${product['minimum_order_quantity']}',
                style: TextStyle(fontSize: 16)),

            SizedBox(height: 16.0),

            // Action button for adding to cart or further action
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press (e.g., Add to Cart)
                },
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}