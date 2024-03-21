import 'package:portfolio/app/routes/app_pages.dart';
import 'package:portfolio/app/shared/ui/navbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyOverlay extends StatelessWidget {
  const MyOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      height: context.height * 0.2,
      width: context.width,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              for (var i = 0; i < Routes.numRoutes; i++)
                NavButton(
                  index: i,
                  text: Routes.all[i],
                  width: context.width * 0.1,
                  height: context.height * 0.1 * 1,
                )
            ],
          ),
        ),
      ),
    );
  }
}
