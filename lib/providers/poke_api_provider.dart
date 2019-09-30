import 'package:http/http.dart' as http;
import '../models/pokemon_dto.dart';
import '../models/pokemon_model.dart';
import '../models/type_dto.dart';
import 'dart:convert';

class PokeApiProvider {
  String get urlBase => "https://pokeapi.co/api/v2/";

  Future<List<TypeDto>> fetchAllTypes() async {
    final response = await http.get(urlBase + 'type');

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      var ret = new List<TypeDto>.from(
          body["results"].map((x) => TypeDto.fromJson(x)));
      return ret;
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to get pokemon types');
    }
  }

  Future<List<PokemonDto>> fetchPokemonsByType(String type) async {
    final response = await http.get(urlBase + 'type/$type');

    if (response.statusCode == 200) {
      return List<PokemonDto>.from(
        json
            .decode(response.body)["pokemon"]
            .map((x) => x["pokemon"])
            .map((x) => PokemonDto.fromJson(x)),
      );
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to get pokemon by type');
    }
  }

  Future<PokemonModel> fetchPokemonByName(String name) async {
    final response = await http.get(urlBase + 'pokemon/$name');

    if (response.statusCode == 200) {
      return pokemonModelFromJson(response.body);
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to get pokemon by name');
    }
  }
}
