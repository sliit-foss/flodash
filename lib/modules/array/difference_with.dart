import 'flatten.dart';

import '../../_utils/_array.dart';
import '../../_utils/_varargs.dart';

final differenceWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  List subList = flatten(argumentClone.sublist(1));
  return arguments[0]
      .where((e) => evaluateDifference(subList, e, comparator: comparator))
      .toList();
}) as dynamic;
