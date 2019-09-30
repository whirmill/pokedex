import 'package:flutter/material.dart';

Map<int, Color> _color = {
  50: Color(0xfff3e0e0),
  100: Color(0xffe0b3b3),
  200: Color(0xffcc8080),
  300: Color(0xffb84d4d),
  400: Color(0xffa82626),
  500: Color(0xff990000),
  600: Color(0xff910000),
  700: Color(0xff860000),
  800: Color(0xff7c0000),
  900: Color(0xff6b0000),
};

MaterialColor pokedexMaterial = MaterialColor(_color[500].value, _color);
