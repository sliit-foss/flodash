import '../../_utils/_array.dart';

@Deprecated("Use inbuilt List.firstWhere() instead")
dynamic find(List list, dynamic iteratee) {
  try {
    return list.firstWhere((element) => evaluatePredicate(iteratee, element));
  } catch (e) {
    return null;
  }
}
