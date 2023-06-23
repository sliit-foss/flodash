import '../../_utils/_array.dart';
import '../../_utils/_varargs.dart';

final intersectionWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  return baseIntersection(argumentClone, comparator: comparator);
}) as dynamic;
