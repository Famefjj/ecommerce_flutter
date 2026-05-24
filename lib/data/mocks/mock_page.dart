import 'package:flutter/material.dart';

class MockPage extends StatelessWidget {
  const MockPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 116),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: theme.textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}