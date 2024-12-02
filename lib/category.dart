import 'package:api_biz/productlist.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  late Future<List<dynamic>> categories;

  // Fetch categories and products
  Future<List<dynamic>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('https://btobapi-production.up.railway.app/api/categories/'));

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load categories. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to fetch categories. Please check the server connection.');
    }
  }

  @override
  void initState() {
    super.initState();
    categories = fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final categoryList = snapshot.data!;
            return ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                final category = categoryList[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(category['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                    onTap: () {
                      // When a category is tapped, navigate to the products page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductList(category: category),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
