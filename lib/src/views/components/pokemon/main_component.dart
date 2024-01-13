import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/views/breakpoints.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/header_component.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/section_component.dart';

class MainComponent extends StatelessWidget {
  final PokemonModel pokemon;

  const MainComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    final brk = Breakpoints();
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        HeaderComponent(pokemon: pokemon),
        const SizedBox(
          height: 16,
        ),
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
            ),
            width: (brk.desktop < w)
                ? 800
                : (brk.tablet < w)
                    ? w * .6
                    : w * .9,
            height: (h * .5 > 450) ? h * .5 : 450,
            child: SectionComponent(
              pokemon: pokemon,
            ))
      ]),
    );
  }
}
