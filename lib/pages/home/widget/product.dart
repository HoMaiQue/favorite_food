import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  static const routeName = "/product";
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    final argument = ModalRoute.of(context)?.settings.arguments as Map;
    final product =
        Provider.of<ProductProvider>(context).getProductById(argument["id"]);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(product.image), fit: BoxFit.cover),
              ),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Positioned(
                    top: 20,
                    left: 20,
                    child: BackButton(
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.favorite, color: Colors.grey),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(product.favorite)
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 120,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.only(topLeft: Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.timelapse_sharp,
                              color: Colors.grey,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(product.view)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            "assets/images/background/background_product.png"),
                        fit: BoxFit.cover)),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Text(product.title),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 167,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: const Center(
                                child: Text(
                                  "Nguyên liệu",
                                  style: styleTitle,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(product.ingredients),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 167,
                              height: 35,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))),
                              child: const Center(
                                child: Text(
                                  "Cách thực hiện",
                                  style: styleTitle,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(2)),
                              child: Text(product.instructions),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
