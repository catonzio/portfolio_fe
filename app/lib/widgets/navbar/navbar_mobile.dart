import 'package:flutter/material.dart';
import 'package:portfolio/config/configs.dart';
import 'package:portfolio/config/context_extension.dart';
import 'package:portfolio/widgets/navbar/navbar_button_mobile.dart';

class NavbarMobile extends StatelessWidget {
  const NavbarMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.widthP(70),
      height: context.heightP(10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Configs.sectionsInfo.entries
              .map((k) => NavbarButtonMobile(
                    k.key,
                    k.value.icon,
                  ))
              .toList()
          ),
    );
  }
}
