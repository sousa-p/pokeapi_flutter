import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class HeaderComponent extends StatelessWidget {
  final PokemonModel pokemon;
  const HeaderComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Stack(children: [
          Container(
            width: w,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: pokemon.getColors(),
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(child: Image.network(pokemon.getSpriteUrl(), height: 250)),
          Padding(
              padding: const EdgeInsets.only(top: 32, left: 16),
              child: BackButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/');
                  })),
        ]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            "${pokemon.name!} #${pokemon.getFormatedId()}",
            style: const TextStyle(fontSize: 32),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(pokemon.types.length, (index) {
            String type = pokemon.types[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Image.asset(
                'assets/images/tags/$type.png',
              ),
            );
          }),
        ),
      ],
    );
  }
}
