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
  String _dropdownValue = "All";

  var categories = ["All", "T-shirt", "Car", "Fruit", "Vegetable", "Phone"];
  bool isSort = true;

  @override
  void initState() {
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

  void _filterByCategory(String category) {
    List<Product> results = [];
    if (category == "All") {
      results = products;
    } else {
      results = products.where((product) {
        return product.description
            .toLowerCase()
            .contains(category.toLowerCase());
      }).toList();
    }
    setState(() {
      _foundProducts = results;
      _dropdownValue = category;
    });
  }

  void _sortByPrice(bool accending) {
    setState(() {
      isSort = accending;
      products.sort((a, b) => isSort ? a.price.compareTo(b.price) : b.price.compareTo(a.price));
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
          DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              icon: Icon(
                Icons.filter_alt,
                color: Colors.white,
              ),
              items: categories.map((String category) {
                return DropdownMenuItem<String>(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  _filterByCategory(value);
                }
              },
              value: _dropdownValue,
            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) => _filterProducts(value),
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30),
                Row(
                  children: [
                    Text(
                      'Sort by',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        _sortByPrice(!isSort);
                      },
                      icon: isSort ? Icon(Icons.arrow_drop_down) : Icon(Icons.arrow_drop_up),
                    ),
                  ],
                ),
              ],
            ),
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
          context.push('/login');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
