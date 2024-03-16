import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/pages_controller.dart';
import 'package:portfolio/ui/mypage.dart';

class TrialPage extends StatelessWidget {
  const TrialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        isScrollEnabled: () => true,
        body: Container(
            color: Colors.red[200],
            child: const Center(child: Text('This is a trial page'))));
  }
}

class TrialPage2 extends StatelessWidget {
  const TrialPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final Trial2Controller controller = Trial2Controller.to;
    return MyPage(
        isScrollEnabled: controller.isScrollEnabled,
        onChangePage: () => controller.scrollController
            .detach(controller.scrollController.position),
        body: Container(
          width: context.width,
          height: context.height,
          color: Colors.blue.shade300,
          child: SingleChildScrollView(
            controller: controller.scrollController,
            // restorationId: "page2",
            scrollDirection: Axis.vertical,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(100, (index) => Text("Text $index")),
              ),
            ),
          ),
        ));
  }
}

class TrialPage3 extends StatelessWidget {
  const TrialPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        isScrollEnabled: () => true,
        body: Container(
            color: Colors.green[200],
            child: const Center(child: Text('This is a trial page 3'))));
  }
}

// class TrialPage2 extends StatelessWidget {
//   const TrialPage2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GestureDetector(
//         onVerticalDragEnd: (details) {
//           if (details.velocity.pixelsPerSecond.dy > 0) {
//             Navigator.of(context).push(
//               PageRouteBuilder(
//                 transitionDuration: const Duration(milliseconds: 500),
//                 pageBuilder: (context, animation, secondaryAnimation) {
//                   return const TrialPage();
//                 },
//                 transitionsBuilder:
//                     (context, animation, secondaryAnimation, child) {
//                   // the other page appears from top
//                   const begin = Offset(0.0, -1.0);
//                   const end = Offset.zero;
//                   const curve = Curves.easeInQuart;

//                   var tween = Tween(begin: begin, end: end)
//                       .chain(CurveTween(curve: curve));

//                   // Apply different offsets based on the scrolling direction
//                   var offsetAnimation = animation.drive(tween);

//                   return SlideTransition(
//                     position: offsetAnimation,
//                     child: child,
//                   );
//                 },
//               ),
//             );
//           }
//         },
//         child: Container(
//           color: Colors.blue.shade300,
//           child: const Center(
//             child: Text('This is a trial page 2'),
//           ),
//         ),
//       ),
//     );
//   }
// }
