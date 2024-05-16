import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/models/Product.dart';

class HomePage extends StatefulWidget {
  Product product;

  HomePage({super.key, required this.product});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Name: ${widget.product.name}"),
            Text("Description: ${widget.product.description}"),
            Text("Price: ${widget.product.price}"),
            Image.network(widget.product.imageUrl),
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
