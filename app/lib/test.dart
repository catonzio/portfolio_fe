import 'package:flutter/material.dart';
import 'package:portfolio/config/context_extension.dart';
import 'dart:math' as math;

void main(List<String> args) {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Trial(
        elements: [for (int i = 0; i < 8; i++) i],
        nCols: 3,
      ),
    );
  }
}

class Trial extends StatelessWidget {
  final List<int> elements;
  final int nCols;
  final List<Color> colors = [];

  Trial({super.key, required this.elements, required this.nCols}) {
    colors.addAll([
      for (int i = 0; i < elements.length; i++)
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var n = elements.length;
    int nrows = (n / nCols).ceil();
    double elWidth = context.widthP(20);
    double elHeight = elWidth * 9 / 16;

    return Scaffold(
        body: SizedBox(
      width: context.fullWidth,
      height: context.fullHeight,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        for (int i = 0; i < nrows; i++)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int j = 0; j < nCols; j++)
                getIndex(i, nCols, j) < n
                    ? Container(
                        width: elWidth,
                        height: elHeight,
                        margin: const EdgeInsets.all(8),
                        alignment: Alignment.center,
                        color: colors[getIndex(i, nCols, j)],
                        child: Text(elements[getIndex(i, nCols, j)].toString()))
                    : Container(),
            ],
          ),
      ]),
    ));
  }

  int getIndex(int i, int c, int j) => i * c + j;
}
