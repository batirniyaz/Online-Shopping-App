import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isError = false;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login Page",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Enter your username',
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Enter your password',
              ),
            ),
            Visibility(
              child: Text(
                "Invalid username or password",
                style: TextStyle(color: Colors.red),
                ), 
              visible: isError,
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.green),
              onPressed: () {
                var un = usernameController.text;
                var psw = passwordController.text;

                if (un == "admin" && psw == "admin123") {
                  context.go('/add-new-product');
                } else {
                  setState(() {
                    isError = true;
                  });
                }
              }, 
              child: Text(
                "Login", 
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}