import '../../_utils/_array.dart';

List remove(List list, dynamic predicate) {
  List removed = [];
  list.removeWhere((element) {
    if (evaluatePredicate(predicate, element)) {
      removed.add(element);
      return true;
    }
    return false;
  });
  return removed;
}
