import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/page2_controller.dart';
import 'package:portfolio/data/controllers/page_views_controller.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Function() onPressed;

  const ActionButton(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                isSelected ? Colors.white : Colors.transparent)),
        child: Text(text));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageViewsController controller = Get.find<PageViewsController>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          actions: [
            Obx(() => ActionButton(
                onPressed: () => controller.changePage(0),
                isSelected: controller.currentIndex == 0,
                text: "Page 1")),
            Obx(() => ActionButton(
                onPressed: () => controller.changePage(1),
                isSelected: controller.currentIndex == 1,
                text: "Page 2")),
            Obx(() => ActionButton(
                onPressed: () => controller.changePage(2),
                isSelected: controller.currentIndex == 2,
                text: "Page 3")),
          ],
        ),
        body: DefaultTextStyle(
          style: context.textTheme.displaySmall!.copyWith(color: Colors.black),
          child: PageView(
            controller: controller.pageController,
            scrollDirection: Axis.vertical,
            pageSnapping: false,
            dragStartBehavior: DragStartBehavior.down,
            children: const [Page1(), Page2(), Page3()],
          ),
        ));
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red.shade200,
      alignment: Alignment.center,
      child: const Text("Page 1"),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final PageViewsController pagesController = Get.find<PageViewsController>();
    final Page2Controller controller = Get.find<Page2Controller>();

    return Container(
        color: Colors.blue.shade200,
        alignment: Alignment.center,
        child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) =>
                controller.onScrollNotification(scrollNotification,
                    pagesController.previousPage, pagesController.nextPage),
            child: ListView.builder(
              controller: controller.scrollController,
              key: controller.storageKey,
              itemCount: 100,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Item $index"),
                );
              },
            )));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green.shade200,
      alignment: Alignment.center,
      child: const Wrap(
        spacing: 100,
        children: [
          Text("Page 2.1"),
          Text("Page 2.2"),
          Text("Page 2.3"),
          Text("Page 2.4"),
        ],
      ),
    );
  }
}
