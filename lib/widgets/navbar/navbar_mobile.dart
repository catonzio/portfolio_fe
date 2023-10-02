import 'package:flutter/material.dart';
import 'package:portfolio/config/dimensions.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.width(context, perc: 70),
      height: Dimensions.height(context, perc: 10),
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
