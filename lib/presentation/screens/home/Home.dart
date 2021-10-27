import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:customer/presentation/screens/home/favorite_page.dart';
import 'package:customer/presentation/screens/home/home_page.dart';
import 'package:customer/presentation/screens/profil/profil_screen.dart';
import 'package:customer/presentation/screens/home/search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    SearchPage(),
    FavoritePage(),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) =>
      Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type : BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black38,
          currentIndex: currentIndex,
          selectedItemColor: Colors.black,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.manage_search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_box),
              label: 'Account',
            )
          ],

        ),
      );
}