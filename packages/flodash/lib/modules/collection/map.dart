import '../../_utils/_array.dart';

@Deprecated("Use inbuilt List.map() instead")
List map(List list, dynamic iteratee) =>
    list.map((element) => evaluatePredicateKey(iteratee, element)).toList();
