import 'package:favotire_food/pages/home/home_body.dart';
import 'package:favotire_food/pages/home/widget/category.dart';
import 'package:favotire_food/pages/home/widget/product.dart';
import 'package:favotire_food/pages/index.dart';
import 'package:favotire_food/providers/category.provider.dart';
import 'package:favotire_food/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
        initialRoute: HomeBody.routeName,
        routes: {
          Category.routeName: ((context) => const Category()),
          Product.routeName: ((context) => const Product()),
        },
      ),
    ),
  );
}
