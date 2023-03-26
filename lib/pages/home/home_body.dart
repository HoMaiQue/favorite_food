import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/pages/home/widget/category.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  static const routeName = "/";
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(builder: ((context) => const Category())));

              // Navigator.push(context,
              //     MaterialPageRoute(builder: ((context) => const Category())));

              Navigator.pushNamed(context, Category.routeName,
                  arguments: {"title": index});
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
                        image: const DecorationImage(
                          image:
                              NetworkImage("http://placeimg.com/640/480/city"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                const Expanded(
                  flex: 1,
                  child: Center(
                      child: Text("Principal Tactics Developer",
                          style: styleTitle, textAlign: TextAlign.center)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
