import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/models/pokemon_model.dart';

class PokemonCardComponent extends StatelessWidget {
  final PokemonModel pokemon;
  const PokemonCardComponent({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, '/pokemon', arguments: {'id': pokemon.id});
        },
        child: Container(
          width: 382,
          height: 132,
          padding: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.20),
                blurRadius: 4,
                offset: const Offset(2, 4),
              ),
            ],
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              colors: [
                Color.fromRGBO(250, 250, 250, 1),
                Color.fromRGBO(220, 220, 220, 1)
              ],
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '#${pokemon.getFormatedId()}',
                    style: const TextStyle(color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    pokemon.name!,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
              Stack(
                children: [
                  Row(
                    children: [
                      const SizedBox(
                        width: 216,
                      ),
                      SizedBox(
                        width: 146,
                        child: Image.asset(
                          'assets/images/icons/pokeball.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 150,
                  ),
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: Image.network(
                      pokemon.getSpriteUrl(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
