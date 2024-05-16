import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/models/Product.dart';
import 'package:online_shop/products.dart';

class AddNewProductPage extends StatefulWidget {

  AddNewProductPage({Key? key}) : super(key: key);

  @override
  State<AddNewProductPage> createState() => _AddNewProductPageState();
}

class _AddNewProductPageState extends State<AddNewProductPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  bool isFilled = false;

  String _dropdownValue = "T-shirt";

  var categories = ["T-shirt", "Car", "Fruit", "Vegetable", "Phone"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            context.push("/");
          },
        ),
        title: Text('Add New Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Enter product title',
              ),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(
                hintText: 'Enter product price',
              ),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(
                hintText: 'Enter product image URL',
              ),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            DropdownButton(
              items: categories.map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _dropdownValue = value!;
                });
              },
              value: _dropdownValue,
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Visibility(
              child: Text(
              "Please fill all fields",
              style: TextStyle(color: Colors.red),
              ),
              visible: isFilled,),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,),
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    priceController.text.isNotEmpty &&
                    imageUrlController.text.isNotEmpty &&
                    _dropdownValue.isNotEmpty) {
                  Product product = Product(
                    name: nameController.text,
                    price: double.parse(priceController.text),
                    imageUrl: imageUrlController.text,
                    description: _dropdownValue,
                  );
                  products.insert(0, product);
                  context.go('/');
                } else {
                  setState(() {
                    isFilled = true;
                  });
                }
              }, 
              child: Text(
                'Add Product',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
            ),
          ],
        ),
      ),
    );
  }
}

