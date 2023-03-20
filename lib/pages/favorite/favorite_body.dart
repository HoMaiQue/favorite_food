import 'package:favotire_food/config/const.dart';
import 'package:flutter/material.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.white,
          ),
          key: ValueKey<int>(index),
          onDismissed: (DismissDirection direction) {},
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 140,
              child: GridTile(
                footer: const GridTileBar(
                  title: Text(
                    "District Program Strategist",
                    style: styleTitle,
                  ),
                  trailing: Icon(
                    Icons.swipe,
                    size: buttonSize,
                    color: dButtonColorInactive,
                  ),
                  backgroundColor: dFooterColor,
                ),
                child: Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage("http://placeimg.com/640/480"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
