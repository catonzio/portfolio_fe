import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio/data/controllers/projects_controller.dart';
import 'package:portfolio/widgets/project_card.dart';

class CustomGrid extends StatelessWidget {
  final List<dynamic> elements;
  final int nCols;
  final int n;
  final int nrows;
  final Size size;

  const CustomGrid(
      {Key? key,
      required this.elements,
      required this.nCols,
      required this.n,
      required this.nrows,
      required this.size})
      : super(key: key);

  factory CustomGrid.fromList(
      {required List<dynamic> elements,
      required int nCols,
      required Size gridSize}) {
    int n = elements.length;
    int nrows = (n / nCols).ceil();
    return CustomGrid(
      key: UniqueKey(),
      elements: elements,
      nCols: nCols,
      n: n,
      nrows: nrows,
      size: gridSize,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, children: buildRows()),
    );
  }

  List<Widget> buildRows() {
    List<Widget> results = [];
    double elWidth = size.width / nCols * 0.9;
    double elHeight = elWidth * 9 / 16;
    for (int i = 0; i < nrows; i++) {
      results.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: buildElems(i, elWidth, elHeight)));
    }
    return results;
  }

  List<Widget> buildElems(int rowN, double elWidth, double elHeight) {
    List<Widget> results = [];

    for (int j = 0; j < nCols; j++) {
      int idx = getIndex(rowN, nCols, j);
      if (idx < n) {
        var element = elements[idx];
        Get.put(ProjectsController(), tag: element.id.toString());
        results.add(Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: elWidth,
              height: elHeight,
              // margin: const EdgeInsets.all(8),
              alignment: Alignment.center,
              child: ProjectCard(
                details: element,
                width: elWidth,
                height: elHeight,
                // index: getIndex(i, nCols, j),
              )),
        ));
      }
    }
    return results;
  }

  int getIndex(int i, int c, int j) => i * c + j;
}
