import 'package:flutter/material.dart';
import 'package:portfolio/config/context_extension.dart';

class ReturnUpButton extends StatelessWidget {
  final Function() onPressed;
  const ReturnUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: context.colorScheme.inversePrimary,
      child: const Icon(
        Icons.arrow_upward_sharp,
      ),
    );
  }
}
