import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:online_shop/pages/LoginPage.dart';
import 'package:online_shop/pages/HomePage.dart';
// import 'package:online_shop/pages/AddNewProductPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key
    });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}


final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => HomePage(),
    ),
    // GoRoute(
    //   path: '/add-new-product',
    //   pageBuilder: (context, state) => AddNewProductPage(),
    // ),
  ],
);