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
  
  List<Product> products = [
    Product(
      name: 'Hugo, T-Shirt',
      description: 'Description 1',
      price: 100.0,
      imageUrl: 'https://cms.brnstc.de/product_images/680x930_retina/cpro/media/images/product/22/2/100127991411000_0_1645368645961.jpg',
    ),
    Product(
      name: 'Boss, T-Shirt',
      description: 'Description 2',
      price: 200.0,
      imageUrl: 'https://images.hugoboss.com/is/image/boss/hbeu50481923_405_100?\$re_fullPageZoom\$&qlt=85&fit=crop,1&align=1,1&lastModified=1715716929000&wid=1200&hei=1818',
    ),
    Product(
      name: 'BMW, Car',
      description: 'Description 3',
      price: 300.0,
      imageUrl: 'https://cache.bmwusa.com/cosy.arox?pov=walkaround&brand=WBBM&vehicle=25XK&client=byo&paint=P0300&fabric=FLKSW&sa=S01CE,S01MA,S01TE,S0302,S0319,S0322,S03MC,S03MF,S0402,S0420,S0423,S0459,S04FL,S04GQ,S04HB,S04MA,S04MC,S04NB,S0552,S05AC,S05AS,S05DW,S0688,S06AC,S06AK,S06C4,S06CP,S06NX,S06U3,S0776,S07M9&quality=70&bkgnd=transparent&resp=png&angle=60&w=10000&h=10000&x=0&y=0',
    ),
    Product(
      name: 'Mercedes, Car',
      description: 'Description 4',
      price: 400.0,
      imageUrl: 'https://www.mbusa.com/content/dam/mb-nafta/us/myco/my22/c/sedan/all-vehicles/2022-C300-SEDAN-AVP-DR.png',
    ),
    Product(
      name: 'Apple, Fruit',
      description: 'Description 5',
      price: 500.0,
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/1200px-Red_Apple.jpg',
    ),
    Product(
      name: 'Banana, Fruit',
      description: 'Description 6',
      price: 600.0,
      imageUrl: 'https://i5.walmartimages.com/seo/Fresh-Banana-Fruit-Each_5939a6fa-a0d6-431c-88c6-b4f21608e4be.f7cd0cc487761d74c69b7731493c1581.jpeg',
    ),
    Product(
      name: 'Carrot, Vegetable',
      description: 'Description 7',
      price: 700.0,
      imageUrl: 'https://static.libertyprim.com/files/familles/carotte-large.jpg?1569271734',
    ),
    Product(
      name: 'Potato, Vegetable',
      description: 'Description 8',
      price: 800.0,
      imageUrl: 'https://www.instacart.com/company/wp-content/uploads/2021/05/012_GRW_Blog-Images_Baking-Potatoes-1050x525.jpg',
    ),
    Product(
      name: 'Samsung, Phone',
      description: 'Description 9',
      price: 900.0,
      imageUrl: 'https://images.samsung.com/is/image/samsung/p6pim/ph/2401/gallery/ph-galaxy-s24-plus-sm-s926bzvcphl-thumb-539305886',
    ),
    Product(
      name: 'Apple, Phone',
      description: 'Description 10',
      price: 1000.0,
      imageUrl: 'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/MT233?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=1693248327138',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.white,
        title: Text('Products'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {},),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {},),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.7,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1.0,
                  child: Image.network(products[index].imageUrl, fit: BoxFit.cover,),
                ),
                ListTile(
                  title: Text(products[index].name),
                  subtitle: Text(products[index].description),
                  trailing: Text('\$${products[index].price}'),
                ),
              ],
            ),
          );
        },
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
