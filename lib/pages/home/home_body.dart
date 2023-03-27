import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/pages/home/widget/category.dart';
import 'package:favotire_food/providers/category.provider.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  static const routeName = "/";
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: CategoryProvider().readJson(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = snapshot.hasData ? snapshot.data : [];
          return snapshot.hasData
              ? GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: ((context) => const Category())));

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: ((context) => const Category())));

                        Navigator.pushNamed(context, Category.routeName,
                            arguments: {
                              "title": data[index].name,
                              "categoryId": data[index].id
                            });
                      },
                      child: Column(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.amber,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        data[index].image.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )),
                          Expanded(
                            flex: 1,
                            child: Center(
                                child: Text(data[index].name.toString(),
                                    style: styleTitle,
                                    textAlign: TextAlign.center)),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : const Center(child: Text("Data not found"));
        });
  }
}
