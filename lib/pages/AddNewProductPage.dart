import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AddNewProductPage extends StatelessWidget {
  AddNewProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/home");
          },
        ),
        title: Text('Add New Product'),
      ),
      body: Center(
        child: Text('Add New Product Page'),
      ),
    );
  }
}

