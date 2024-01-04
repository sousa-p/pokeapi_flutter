import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/controllers/pokemon_controller.dart';
import 'package:pokeapi_flutter/src/views/components/pokemon/main_component.dart';
import 'package:pokeapi_flutter/src/views/components/shared/error_component.dart';
import 'package:pokeapi_flutter/src/views/components/shared/loading_component.dart';

class PokemonView extends StatefulWidget {
  const PokemonView({super.key});

  @override
  State<PokemonView> createState() => _PokemonViewState();
}

class _PokemonViewState extends State<PokemonView> {
  final PokemonController controller = PokemonController();

  _stateManagement(PokemonState state) {
    switch (state) {
      case PokemonState.loading:
        return const LoadingComponent();
      case PokemonState.success:
        return MainComponent(pokemon: controller.pokemon);
      default:
        return ErrorComponent(handleClick: () async => controller.init());
    }
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      Map<String, dynamic>? args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;
      if (args != null && args.containsKey('id')) {
        controller.id = args['id'];
        controller.init();
      } else {
        Navigator.pushNamed(context, '/');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'), repeat: ImageRepeat.repeat),
        ),
        child: AnimatedBuilder(
            animation: controller.state,
            builder: (context, child) => _stateManagement(controller.state.value)),
      ),
    );
  }
}
