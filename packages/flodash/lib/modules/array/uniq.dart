import '../../_utils/_array.dart';

List _uniq(List list, {dynamic comparator}) {
  List result = [];
  for (dynamic element in list) {
    if (!result
        .where((e) => evaluateOperation(e, element, comparator: comparator))
        .isNotEmpty) {
      result.add(element);
    }
  }
  return result;
}

List uniq(List list) => _uniq(list);

List uniqBy(List list, dynamic iteratee) => _uniq(list, comparator: iteratee);
