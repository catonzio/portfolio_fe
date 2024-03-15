import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/config/pages.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';

class MyOverlay extends StatelessWidget {
  const MyOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      height: context.height * 0.1,
      width: context.width,
      child: Container(
        color: Colors.black.withOpacity(0.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (var i = 0; i < Pages.pages.length; i++)
              ElevatedButton(
                onPressed: () => changePage(context, i),
                child: Center(
                  child: Text(
                    Pages.pages.keys.toList()[i],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<Object?> changePage(BuildContext context, int pageNum) =>
      Navigator.of(context).pushNamed(Pages.pages.keys.toList()[pageNum]);
}

class MyPage extends StatelessWidget {
  final Widget body;
  const MyPage({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    final PagesController controller = PagesController.to;
    return Scaffold(
      body: Listener(
        onPointerSignal: (event) => event is PointerScrollEvent
            ? changePage(context, controller, event.scrollDelta)
            : null,
        child: GestureDetector(
            onVerticalDragEnd: (details) =>
                changePage(context, controller, details),
            child: Stack(
              children: [
                Positioned(top: 0, bottom: 0, left: 0, right: 0, child: body),
                const MyOverlay()
              ],
            )),
      ),
    );
  }

  Future<Object?> changePage(
          BuildContext context, PagesController controller, dynamic event) =>
      Navigator.of(context)
          .pushNamed(Pages.pages.keys.toList()[controller.onChange(event)]);
}
