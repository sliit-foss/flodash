import '../../_utils/_array.dart';

List reject(List list, dynamic iteratee) =>
    list.where((element) => !evaluatePredicate(iteratee, element)).toList();
