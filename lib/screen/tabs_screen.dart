import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screen/categories_screen.dart';
import 'package:meals_app/screen/favorites_screen.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late final List<Map<String, dynamic>> _pages;
  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
  @override
  void initState() {
      _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoritesScreen(widget.favoriteMeals), 'title': 'Your Favorites'},
    ];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_pages[_selectedPageIndex]['title'].toString()),
        ),
        drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.amber,
          currentIndex: _selectedPageIndex,
          type: BottomNavigationBarType.shifting,
          onTap: (index) {
            setState(() {
              _selectPage(index);
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(Icons.star),
              label: 'Favorites',
            ),
          ],
        ));
  }
}
