import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/products.dart';

class HomePage extends StatefulWidget {
  final Product product;

  HomePage({super.key, required this.product});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  List<Product> _foundProducts = [];
  @override
  initState() {
    _foundProducts = products;
    super.initState();
  }

  void _filterProducts(String enteredText) {
    List<Product> results = [];
    if (enteredText.isEmpty) {
      results = products;
    } else {
      results = products.where((product) {
        return product.name.toLowerCase().contains(enteredText.toLowerCase());
      }).toList();
    }
    setState(() {
      _foundProducts = results;
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: Text('Products'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 5.0),
            TextField(
              onChanged: (value) => _filterProducts(value),
              decoration: InputDecoration(
                hintText: 'Search products...',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              )
            ),
            SizedBox(height: 5.0),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.7,
                ),
                itemCount: _foundProducts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 1.0,
                          child: Image.network(
                            _foundProducts[index].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        ListTile(
                          title: Text(_foundProducts[index].name),
                          subtitle: Text(_foundProducts[index].description),
                          trailing: Text('\$${_foundProducts[index].price}'),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/login');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
