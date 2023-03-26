import 'dart:convert';

import 'package:favotire_food/model/category.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> _list = [];

  List<Category> get list => [..._list];

  Future<List<Category>> readJson() async {
    final String response =
        await rootBundle.loadString("assets/json/category.json");
    final parseList = await json.decode(response);
    List<Category> dataList = List<Category>.from(
        parseList.map((data) => Category.fromJson(jsonEncode(data))));
    _list = dataList;
    notifyListeners();
    return dataList;
  }
}
