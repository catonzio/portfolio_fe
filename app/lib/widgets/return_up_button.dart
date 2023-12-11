import 'package:flutter/material.dart';

class ReturnUpButton extends StatelessWidget {
  final Function() onPressed;
  const ReturnUpButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(
        Icons.arrow_upward_sharp,
      ),
    );
  }
}
