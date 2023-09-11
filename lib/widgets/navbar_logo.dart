import 'package:dcatone/configs/app_typography.dart';
import 'package:flutter/material.dart';

class NavbarLogo extends StatelessWidget {
  const NavbarLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "< ",
          style: AppText.b1,
        ),
        Text(
          "Danilo Catone",
          style: AppText.b1b!.copyWith(fontFamily: "Agustina"),
        ),
        Text(
          MediaQuery.of(context).size.width >= 1000 ? " />\t\t" : " />",
          style: AppText.b1,
        )
      ],
    );
  }
}
