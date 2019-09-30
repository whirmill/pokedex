import 'package:flutter/material.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({this.optionStyle});

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sfoglia'),
        ),
        body: Center(child: Text('Sfoglia', style: optionStyle)));
  }
}
