const double totalHeight = 38400;

// const double spaceshipBottom = 320;
const double spaceshipBottom = 250;

const double spaceshipImageWidth = 345;
const double spaceshipImageHeight = 743;
const double fireImageWidth = 658;
const double fireImageHeight = 226;

const double spaceshipFactor = 1 / 4;

const double spaceshipWidth = spaceshipImageWidth * spaceshipFactor;
const double spaceshipHeight = spaceshipImageHeight * spaceshipFactor;
const double fireWidth = fireImageWidth * spaceshipFactor;
const double fireHeight = fireImageHeight * spaceshipFactor;
const double totalSpaceshipHeight = spaceshipHeight + fireHeight;
const double totalSpaceshipWidth = fireWidth;

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
