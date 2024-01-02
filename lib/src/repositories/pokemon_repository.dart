import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class PokemonRepository {
  final String baseUrl = 'pokeapi.co';

  Future<List<PokemonModel>> getPokemons({int offset = 0, int limit = 20}) async {
    String endpoint = '/api/v2/pokemon';
    Map<String, dynamic> params = {'offset': offset.toString(), 'limit': limit.toString()};
    Uri url = Uri.https(baseUrl, endpoint, params);

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var results = json['results'] as List;
    return results.map((e) => PokemonModel.fromJson(e)).toList();
  }

  Future<PokemonModel> getPokemon(dynamic search) async {
    String endpoint = '/api/v2/pokemon/$search';
    Uri url = Uri.https(baseUrl, endpoint);

    var response = await http.get(url);
    var json = jsonDecode(response.body);
    return PokemonModel.fromJson(json);
  }
}
