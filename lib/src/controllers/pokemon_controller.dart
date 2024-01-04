import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/repositories/pokemon_repository.dart';

class PokemonController {
  final PokemonRepository repository = PokemonRepository();
  late int id;
  late PokemonModel pokemon;
  ValueNotifier<PokemonState> state = ValueNotifier<PokemonState>(PokemonState.loading);

  Future<void> init() async {
    state.value = PokemonState.loading;
    try {
      pokemon = await repository.getPokemon(id);
      state.value = PokemonState.success;
    } catch (_) {
      state.value = PokemonState.error;
    }
  }
}

enum PokemonState { loading, error, success }
