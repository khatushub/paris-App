import 'package:flutter/material.dart';
import 'home.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecipeDetailScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}