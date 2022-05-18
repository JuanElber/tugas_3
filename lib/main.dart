import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas_chapter_9/ui/BookmarksScreen.dart';
import 'package:tugas_chapter_9/ui/GroceriesScreen.dart';
import 'package:tugas_chapter_9/ui/RecipesScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String bottomNavIndex = 'bottomNavIndex';
  int _index = 0;

  void _savePageState(int index) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt(bottomNavIndex, index);
  }

  void _loadPageState() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _index = prefs.getInt(bottomNavIndex) ?? 0;
    });
  }

  void setNavIndex(int index) {
    setState(() {
      _savePageState(index);
      _loadPageState();
    });
  }

  final List<Widget> _listWidget = [
    const RecipesScreen(),
    const BookmarksScreen(),
    const GroceriesScreen(),
  ];
  final List<String> title = [
    'Recipes',
    'Bookmarks',
    'Groceries',
  ];

  @override
  void initState() {
    _loadPageState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title[_index],
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: _listWidget[_index],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
            icon: _index == 0
                ? const Icon(
                    Icons.restaurant_menu,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.restaurant_menu_outlined,
                    color: Colors.black54,
                  ),
            label: 'Recipes',
          ),
          BottomNavigationBarItem(
            icon: _index == 1
                ? const Icon(
                    Icons.bookmarks,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.bookmarks_outlined,
                    color: Colors.black54,
                  ),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: _index == 2
                ? const Icon(
                    Icons.view_list,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.view_list_outlined,
                    color: Colors.black54,
                  ),
            label: 'Groceries',
          ),
        ],
        onTap: (int index) {
          setNavIndex(index);
        },
      ),
    );
  }
}
