import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class AboutComponent extends StatelessWidget {
  final PokemonModel pokemon;

  const AboutComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            spacing: 64,
            runSpacing: 32,
            children: [
              Column(
                children: [const Text('Height'), Text("${pokemon.height}m")],
              ),
              Column(
                children: [const Text('Weight'), Text("${pokemon.weight}m")],
              ),
              Column(
                children: [const Text('Abilities'), Text("${pokemon.abilities}m")],
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Weakenes'),
          ),
          Wrap(
              children: List.generate(
            pokemon.weaknesses.length,
            (index) {
              String type = pokemon.weaknesses[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'assets/images/tags/$type.png',
                ),
              );
            },
          )),
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text('Strengths'),
          ),
          Wrap(
              children: List.generate(
            pokemon.strengths.length,
            (index) {
              String type = pokemon.strengths[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  'assets/images/tags/$type.png',
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
