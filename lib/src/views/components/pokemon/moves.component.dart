import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class MovesComponent extends StatelessWidget {
  final PokemonModel pokemon;
  const MovesComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: pokemon.moves.length,
        itemBuilder: (BuildContext context, int index) {
          String move = pokemon.moves[index];

          return Column(
            children: [
              ListTile(title: Text(move)),
              const Divider(
                height: 1,
                color: Color.fromARGB(255, 216, 216, 216),
              )
            ],
          );
        });
  }
}
