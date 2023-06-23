import '../../_utils/_array.dart';

List dropWhile(List list, dynamic predicate) {
  for (int i = 0; i < list.length; i++) {
    if (evaluatePredicate(predicate, list[i])) {
      list.removeAt(i);
      i--;
    } else {
      break;
    }
  }
  return list;
}
