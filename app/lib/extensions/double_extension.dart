extension MyDouble on double {
  bool isInBetween(double min, double max) {
    return min < this && this < max;
  }

  bool isNear(double target, double delta) {
    return (this - target).abs() < delta;
  }
}
