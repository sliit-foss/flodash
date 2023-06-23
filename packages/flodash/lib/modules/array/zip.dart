import 'nth.dart';

import '../../_utils/_varargs.dart';

final zip = VarargsFunction((arguments) {
  List result = [];
  int maxLength =
      arguments.map((e) => e.length).reduce((a, b) => a > b ? a : b);
  for (int i = 0; i < maxLength; i++) {
    result.add(arguments.map((l) => nth(l, n: i)).toList());
  }
  return result;
}) as dynamic;
