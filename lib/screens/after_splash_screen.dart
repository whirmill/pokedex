import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'browse_screen.dart';
import 'search_screen.dart';
import '../settings/colors/pokedex.dart';

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(
      optionStyle: optionStyle,
    ),
    BrowseScreen(
      optionStyle: optionStyle,
    ),
    SearchScreen(
      optionStyle: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Pokedex'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.import_contacts),
            title: Text('Sfoglia'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_list),
            title: Text('Cerca'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: pokedexMaterial.shade400,
        unselectedItemColor: pokedexMaterial.shade900,
        onTap: _onItemTapped,
      ),
    );
  }
}

class AfterSplashScreen extends StatefulWidget {
  @override
  _AfterSplashScreenState createState() => _AfterSplashScreenState();
}
