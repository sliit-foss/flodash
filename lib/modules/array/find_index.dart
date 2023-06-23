import '../../_utils/_array.dart';

@Deprecated("Use inbuilt List.indexOf() or List.indexWhere() instead")
int findIndex(List list, dynamic predicate, {int fromIndex = 0}) {
  for (int i = fromIndex; i < list.length; i++) {
    if (evaluatePredicate(predicate, list[i])) return i;
  }
  return -1;
}
