import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class MainComponent extends StatelessWidget {
  final PokemonModel pokemon;

  const MainComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Text(pokemon.name!);
  }
}
