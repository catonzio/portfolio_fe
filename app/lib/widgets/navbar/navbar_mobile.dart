import 'package:flutter/material.dart';
import 'package:portfolio/config/context_extension.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.widthP(70),
      height: context.heightP(10),
      color: Colors.red,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
        IconButton(onPressed: () => {}, icon: const Icon(Icons.menu)),
      ]),
    );
  }
}
