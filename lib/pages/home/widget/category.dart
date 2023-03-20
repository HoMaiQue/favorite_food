import 'package:favotire_food/config/const.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(10),
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: GridTile(
            footer: const GridTileBar(
              backgroundColor: dFooterColor,
              title: Center(
                child: Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Human Intranet Planner",
                    style: styleTitle,
                  ),
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  SizedBox(
                    width: 10,
                  ),
                  Text("123"),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.timelapse_sharp),
                  SizedBox(
                    width: 10,
                  ),
                  Text("123"),
                ],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: const Image(
                image: NetworkImage('http://placeimg.com/640/480'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
