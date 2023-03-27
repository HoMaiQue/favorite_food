import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/model/product.model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<ProductModel>(context, listen: false);
    return Container(
      width: double.infinity,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: dFooterColor,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                product.title,
                style: styleTitle,
              ),
            ),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<ProductModel>(builder: ((context, product, child) {
                return Row(
                  children: [
                    InkWell(
                        onTap: (() {
                          product.toggleIsFavorite();
                        }),
                        child: Icon(
                          Icons.favorite,
                          color: product.isFavorite ? Colors.red : Colors.white,
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      product.favorite,
                      style: const TextStyle(color: Colors.black),
                    )
                  ],
                );
              })),
              const SizedBox(
                width: 10,
              ),
              const Icon(Icons.timelapse_sharp),
              const SizedBox(
                width: 10,
              ),
              Text(
                product.view,
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image(
            image: AssetImage(product.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
