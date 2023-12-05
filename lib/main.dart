import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restau_app/model/cart_model.dart';
import 'package:restau_app/pages/home_page.dart';
import 'pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
            title: 'Restau App',
            debugShowCheckedModeBanner: false,
            home: IntroPage()));
  }
}
