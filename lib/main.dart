import 'package:flutter/material.dart';
import 'package:provider_example/models/cart.dart';
import 'package:provider_example/screens/cart.dart';
import 'package:provider_example/screens/catalog.dart';
import 'package:provider_example/screens/login.dart';
import 'package:provider/provider.dart';

void main() {
  // The app starts with initializing the model.
  final cart = CartModel();

  // Now we're ready to run the Flutter UI.
  runApp(
    Provider<CartModel>(
      // Here's where we provide the model to any interested widget below.
      builder: (context) => cart,
      dispose: (context, value) => value.dispose(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: TextTheme(
          display4: TextStyle(
            fontFamily: 'Corben',
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: Colors.black,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyLoginScreen(),
        '/catalog': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
