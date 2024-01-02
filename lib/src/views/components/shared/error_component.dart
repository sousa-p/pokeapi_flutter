import 'package:flutter/material.dart';

class ErrorComponent extends StatelessWidget {
  final Function handleClick;

  const ErrorComponent({super.key, required this.handleClick});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(onPressed: handleClick(), child: const Text('Try again')),
    );
  }
}
