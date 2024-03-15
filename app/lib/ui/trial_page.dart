import 'package:flutter/material.dart';
import 'package:portfolio/ui/mypage.dart';

class TrialPage extends StatelessWidget {
  const TrialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Container(
            color: Colors.red[200],
            child: const Center(child: Text('This is a trial page'))));
  }
}

class TrialPage2 extends StatelessWidget {
  const TrialPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return MyPage(
        body: Container(
      color: Colors.blue.shade300,
      child: const Center(
        child: Text('This is a trial page 2'),
      ),
    ));
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
