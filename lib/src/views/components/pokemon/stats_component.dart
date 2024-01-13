import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';
import 'package:pokeapi_flutter/src/models/stat_model.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/stat_bar_component.dart';

class StatsComponent extends StatelessWidget {
  final PokemonModel pokemon;
  const StatsComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: List.generate(pokemon.stats.length, (index) {
              StatModel stat = pokemon.stats[index];
              return StatBarComponent(attribute: stat.name!, points: stat.points!);
            }),
          ),
          SizedBox(
            width: 450,
            child: Wrap(
              alignment: WrapAlignment.start,
              children: [
                const SizedBox(
                  width: 125,
                  child: Text('Total'),
                ),
                Text(pokemon.total.toStringAsFixed(0))
              ],
            ),
          )
        ],
      ),
    );
  }
}
