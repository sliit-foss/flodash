import '../../_utils/_array.dart';

import '../lang/main.dart';

List orderBy(List list, List<dynamic> iteratees, [dynamic orders]) {
  orders = orders != null
      ? orders.map((o) {
          if (o is String) return o == 'asc' ? true : false;
          if (o is num) return o == 1 ? true : false;
          return o;
        }).toList()
      : List.generate(iteratees.length, (index) => true);
  int sortOrder(
      List<dynamic> iteratees, List<dynamic> orders, dynamic a, dynamic b) {
    dynamic iteratee = iteratees.first;
    dynamic order = orders.first ? 1 : -1;
    final valueA = evaluatePredicateKey(iteratee, a);
    final valueB = evaluatePredicateKey(iteratee, b);
    if (gt(valueA, valueB)) return (1 * order).toInt();
    if (lt(valueA, valueB)) return (-1 * order).toInt();
    return iteratees.length > 1
        ? sortOrder(iteratees.sublist(1), orders.sublist(1), a, b)
        : 0;
  }

  list.sort((a, b) => sortOrder(iteratees, orders, a, b));
  return list;
}
