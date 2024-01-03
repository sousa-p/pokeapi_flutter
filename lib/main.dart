import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/views/index_view.dart';
import 'package:pokeapi_flutter/src/views/pokemon_view.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const IndexView(),
        '/pokemon': (context) => const PokemonView(),
      },
      initialRoute: '/',
    );
  }
}
