import '../../_utils/_array.dart';

List dropRightWhile(List list, dynamic predicate) {
  for (int i = list.length - 1; i >= 0; i--) {
    if (evaluatePredicate(predicate, list[i])) {
      list.removeAt(i);
    } else {
      break;
    }
  }
  return list;
}
