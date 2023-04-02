import 'dart:convert';

import 'package:favotire_food/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];

  List<ProductModel> get productList => [..._productList];
  List<ProductModel> getProductByCategoryId(categoryId) {
    return _productList
        .where((product) => product.categoryId == categoryId)
        .toList();
  }
  List<ProductModel> getFavoriteProduct(){
    return _productList.where((product) => product.isFavorite).toList();
  }

  ProductModel getProductById(id) {
    return _productList.singleWhere((product) => product.id == id);
  }

  Future<List<ProductModel>> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/product.json");
    final parseList = await json.decode(response);
    List<ProductModel> dataList = List<ProductModel>.from(
        parseList.map((data) => ProductModel.fromJson(jsonEncode(data))));
    _productList = dataList;
    // notifyListeners();
    return dataList;
  }
}
