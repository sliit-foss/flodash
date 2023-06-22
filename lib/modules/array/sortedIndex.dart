import '../../_utils/_array.dart';

import '../lang/main.dart';

int _sortedIndex(List list, dynamic value, {dynamic iteratee, operation = lt}) {
  int low = 0;
  int high = list.length;
  if (operation == gte) high--;
  while (low < high) {
    int mid = (low + high) ~/ 2;
    if (evaluateOperation(list[mid], value,
        comparator: iteratee, operation: operation)) {
      low = mid + 1;
    } else {
      high = mid;
    }
  }
  return operation == lt ? low : high;
}

int sortedIndex(List list, dynamic value) => _sortedIndex(list, value);

int sortedIndexBy(List list, dynamic value, dynamic iteratee) =>
    _sortedIndex(list, value, iteratee: iteratee);

int Function(List<dynamic>, dynamic) sortedIndexOf = sortedIndex;

int sortedLastIndex(List list, dynamic value) =>
    _sortedIndex(list, value, operation: gte);

int sortedLastIndexBy(List list, dynamic value, dynamic iteratee) =>
    _sortedIndex(list, value, iteratee: iteratee, operation: gte);

int sortedLastIndexOf(List list, dynamic value) =>
    _sortedIndex(list, value, operation: gte) - 1;
