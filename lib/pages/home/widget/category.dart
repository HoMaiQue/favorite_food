import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/model/product.model.dart';

import 'package:favotire_food/pages/home/widget/category_body.dart';
import 'package:favotire_food/pages/home/widget/product.dart';
import 'package:favotire_food/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  static const routeName = "/category";
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final data = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final dataByCategoryId = Provider.of<ProductProvider>(context)
        .getProductByCategoryId(data["categoryId"]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dMainColor,
        title: Text(data["title"]),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(10),
        itemCount: dataByCategoryId.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).pop();
              Navigator.pushNamed(context, Product.routeName,
                  arguments: {"id": dataByCategoryId[index].id});
            },
            child: ChangeNotifierProvider<ProductModel>.value(
                value: dataByCategoryId[index], child: const CategoryBody()),
          );
        },
      ),
    );
  }
}
