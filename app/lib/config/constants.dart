class Constants {
  static const double totalHeight = 38400;

// static const double spaceshipBottom = 320;
  static const double spaceshipBottom = 250;

  static const double spaceshipImageWidth = 345;
  static const double spaceshipImageHeight = 743;
  static const double fireImageWidth = 658;
  static const double fireImageHeight = 226;

  static const double spaceshipFactor = 1 / 4;

  static const double spaceshipWidth = spaceshipImageWidth * spaceshipFactor;
  static const double spaceshipHeight = spaceshipImageHeight * spaceshipFactor;
  static const double fireWidth = fireImageWidth * spaceshipFactor;
  static const double fireHeight = fireImageHeight * spaceshipFactor;
  static const double totalSpaceshipHeight = spaceshipHeight + fireHeight;
  static const double totalSpaceshipWidth = fireWidth;
}
