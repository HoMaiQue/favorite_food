import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProductList =
        Provider.of<ProductProvider>(context).getFavoriteProduct();

    if (favoriteProductList.isEmpty) {
      return const Center(
        child: Text("Không có sản phẩm yêu thích nào"),
      );
    }
    return ListView.builder(
      itemCount: favoriteProductList.length,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          background: Container(
            color: Colors.white,
          ),
          key: ValueKey<int>(index),
          confirmDismiss: (direction) async {
            return await showDialog(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Xóa món ăn yêu thích'),
                content: const Text('Bạn có muốn xóa không'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('Hủy'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Có'),
                  ),
                ],
              ),
            );
          },
          onDismissed: (DismissDirection direction) {
            favoriteProductList[index].handleRemoveFavorite();
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text("Xóa món ăn yêu thích thành công")));
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: double.infinity,
              height: 140,
              child: GridTile(
                footer: GridTileBar(
                  title: Text(
                    favoriteProductList[index].title,
                    style: styleTitle,
                  ),
                  trailing: const Icon(
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
                    image: DecorationImage(
                        image: AssetImage(favoriteProductList[index].image),
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
