import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'browse_screen.dart';
import '../settings/colors/pokedex.dart';

class PokedexSplashScreen extends StatefulWidget {
  PokedexSplashScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PokedexSplashScreenState createState() => _PokedexSplashScreenState();
}

class _PokedexSplashScreenState extends State<PokedexSplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: BrowseScreen(),
        image: Image.asset('assets/images/poke-dribbble.png'),
        backgroundColor: Colors.white,
        photoSize: 100.0,
        loaderColor: pokedexMaterial.shade400);
  }
}
