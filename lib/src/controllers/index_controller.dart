import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/repositories/pokemon_repository.dart';

class IndexController {
  final PokemonRepository _repository = PokemonRepository();
  List<PokemonModel> loadedPokemons = [];
  String search = '';
  ValueNotifier<IndexState> state = ValueNotifier<IndexState>(IndexState.loading);

  Future<void> init() async {
    state.value = IndexState.loading;
    try {
      List<PokemonModel> newPokemons = await _repository.getPokemons(limit: 30);
      _addPokemons(newPokemons);
      state.value = IndexState.success;
    } catch (_) {
      state.value = IndexState.error;
    }
  }

  Future<void> loadMore() async {
    int count = loadedPokemons.length;
    List<PokemonModel> newPokemons = await _repository.getPokemons(offset: count);
    _addPokemons(newPokemons);
  }

  void _addPokemons(List<PokemonModel> pokemons) {
    int count = loadedPokemons.length;
    int stop = pokemons.length;

    for (var i = 0; i < stop; i++) {
      PokemonModel pokemon = pokemons[i];
      int id = i + 1 + count;
      pokemon.id = id;
      loadedPokemons.add(pokemon);
    }
  }
}

enum IndexState {
  loading,
  success,
  error;
}
