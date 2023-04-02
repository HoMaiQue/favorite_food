import 'package:favotire_food/config/const.dart';
import 'package:favotire_food/pages/favorite/favorite_body.dart';
import 'package:favotire_food/pages/home/home_body.dart';
import 'package:favotire_food/pages/seen/seen_body.dart';
import 'package:favotire_food/providers/product.provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  late Future _dataFuture;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
  }

  static const List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    FavoriteBody(),
    SeenBody()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: dMainColor,
                title: const Text("Favorite food"),
              ),
              body: Center(
                child: _widgetOptions[_selectedIndex],
              ),
              bottomNavigationBar: BottomNavigationBar(
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.favorite),
                      label: 'Favorite',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.timeline_sharp),
                      label: 'Seen',
                    ),
                  ],
                  currentIndex: _selectedIndex,
                  backgroundColor: dMainColor,
                  onTap: _onItemTapped,
                  iconSize: buttonSize,
                  unselectedItemColor: dButtonColorInactive,
                  selectedItemColor: dButtonColorActive));
        });
  }
}
