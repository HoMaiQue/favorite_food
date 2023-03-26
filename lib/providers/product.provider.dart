import 'dart:convert';

import 'package:favotire_food/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> _productList = [];

  List<Product> get productList => [..._productList];

  Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/category.json");
    final parseList = await json.decode(response);
    List<Product> dataList = List<Product>.from(
        parseList.map((data) => Product.fromJson(jsonEncode(data))));
    _productList = dataList;
    notifyListeners();
    return dataList;
  }
}
