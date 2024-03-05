int numScreen(double scrollOffset, double screenHeight) {
  return (scrollOffset / (screenHeight)).floor() + 1;
}

double screenScrollPerca(double scrollOffset, double height) {
  final int screenNum = numScreen(scrollOffset, height);
  final double perc = ((scrollOffset - height * (screenNum - 1)) / height);
  return perc.clamp(0, 1);
}

// double totalScrollPerc(double scrollOffset, double totalHeight) {
//   return (scrollOffset / totalHeight).clamp(0, 1);
// }
