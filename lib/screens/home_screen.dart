import 'package:flutter/material.dart';
import '../models/pokemon_model.dart';
import '../providers/poke_api_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({this.optionStyle});

  final TextStyle optionStyle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Ciao, sono il professor Oak",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      )),
                  // titlePadding: EdgeInsets.symmetric(vertical: 100),
                  background: Image.asset(
                    "assets/images/prof_oak.jpeg",
                    fit: BoxFit.cover,
                  )),
            ),
          ];
        },
        body: Center(
          child: FutureBuilder<PokemonModel>(
            future: PokeApiProvider().fetchPokemonByName("ditto"),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Column(
                    children: <Widget>[
                      Text(snapshot.data.name),
                      Image.network(snapshot.data.sprites.frontDefault)
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
