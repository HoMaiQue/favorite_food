import 'package:favotire_food/config/const.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("http://placeimg.com/640/480"),
                  fit: BoxFit.cover),
            ),
            child: Row(
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.grey),
                      SizedBox(
                        width: 10,
                      ),
                      Text("123")
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
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.timelapse_sharp,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("123")
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                        "Facilis perferendis cumque quaerat autem.Quaerat odio velit saepe deserunt voluptas. Dolores iusto modi veritatis doloribus quo molestiae totam. Molestiae eaque quibusdam voluptas."),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 167,
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
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
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(2)),
                          child: const Text(
                              "Totam qui reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam.reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 167,
                          height: 35,
                          decoration: const BoxDecoration(
                              color: Colors.amber,
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
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(2)),
                          child: const Text(
                              "Totam qui reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam.reiciendis. Pariatur recusandae blanditiis. Qui similique id quo nam"),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ))
      ],
    );
  }
}
