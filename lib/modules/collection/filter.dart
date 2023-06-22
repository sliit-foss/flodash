import '../../_utils/_array.dart';

@Deprecated("Use inbuilt List.where() instead")
List filter(List list, dynamic iteratee) =>
    list.where((element) => evaluatePredicate(iteratee, element)).toList();
