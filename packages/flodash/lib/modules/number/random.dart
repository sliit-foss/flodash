import 'dart:math';

Random r = Random();

dynamic random(num upper, {num? lower, bool floating = false}) {
  lower ??= 0;
  if (floating || upper.runtimeType == double || lower.runtimeType == double) {
    return lower + r.nextDouble() * (upper - lower);
  }
  return lower + (r.nextInt((upper - lower).toInt()));
}
