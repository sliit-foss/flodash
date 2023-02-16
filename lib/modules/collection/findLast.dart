import '../../_utils/_array.dart';

@Deprecated("Use inbuilt List.lastWhere() instead")
dynamic findLast(List list, dynamic iteratee) {
  try {
    return list.lastWhere((element) => evaluatePredicate(iteratee, element));
  } catch (e) {
    return null;
  }
}
