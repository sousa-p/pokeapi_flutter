import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/controllers/pokemon_controller.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({super.key});

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final PokemonController controller = PokemonController();

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Map<String, dynamic>? args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (args != null && args.containsKey('id')) {
        controller.init(args['id']);
      } else {
        Navigator.pushNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
