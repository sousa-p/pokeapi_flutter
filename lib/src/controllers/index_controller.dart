import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/repositories/pokemon_repository.dart';

class IndexController {
  final PokemonRepository _repository = PokemonRepository();
  List<PokemonModel> loadedPokemons = [];
  List<PokemonModel> filteredPokemons = [];
  ValueNotifier<IndexState> state = ValueNotifier<IndexState>(IndexState.loading);

  Future<void> init() async {
    state.value = IndexState.loading;
    try {
      loadedPokemons = await _repository.getPokemons();
      filteredPokemons = loadedPokemons;
      state.value = IndexState.success;
    } catch (_) {
      state.value = IndexState.error;
    }
  }

  Future<void> loadMore() async {
    int count = loadedPokemons.length;
    List<PokemonModel> newPokemons = await _repository.getPokemons(offset: count);

    loadedPokemons.addAll(newPokemons);
    filteredPokemons = loadedPokemons;
  }
}

enum IndexState {
  loading,
  success,
  error;
}
