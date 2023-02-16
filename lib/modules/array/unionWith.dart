import 'flatten.dart';
import 'uniq.dart';

import '../../_utils/_varargs.dart';

final unionWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic comparator = argumentClone.removeLast();
  return uniqBy(flatten(argumentClone), comparator);
}) as dynamic;
