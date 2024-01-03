import 'package:flutter/material.dart';
import 'package:pokeapi_flutter/src/views/index_view.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 117, 117)),
      ),
      home: const IndexView()));
}
