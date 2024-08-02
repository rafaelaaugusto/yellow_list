import 'package:flutter/material.dart';

class YellowList extends StatelessWidget {
  const YellowList({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: Theme.of(context).textTheme.titleLarge,
        children: [
          const TextSpan(text: 'Yellow'),
          TextSpan(
            text: 'List',
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
