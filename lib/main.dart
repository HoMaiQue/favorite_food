import 'package:favotire_food/pages/home/home_body.dart';
import 'package:favotire_food/pages/home/widget/category.dart';
import 'package:favotire_food/pages/index.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      initialRoute: HomeBody.routeName,
      routes: {
        // "/": ((context) => const MyApp()),
        Category.routeName: ((context) => const Category())
      },
    ),
  );
}
