import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/spaceship/scroller.dart';

class MenuRow extends StatelessWidget {
  const MenuRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final Spaceship spaceship = Get.find<Spaceship>();
    return GetX<Scroller>(
      builder: (scroller) {
        return Positioned(
            bottom: scroller.scrollOffset + size.height - 35,
            left: 0,
            height: 30,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      scroller.animateUntilTop();
                    },
                    child: const Text("Go to top")),
                ElevatedButton(
                    onPressed: () {
                      scroller.returnBack();
                    },
                    child: const Text("Return back")),
                SizedBox(
                  width: 30,
                  child: CircularProgressIndicator(
                    value: scroller.totalScrollPerc,
                    color: Colors.green,
                    backgroundColor: Colors.red,
                  ),
                )
              ],
            ));
      },
    );
  }
}
