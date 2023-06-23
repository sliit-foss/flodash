import 'reduce.dart';

import '../../_utils/_array.dart';

Map<dynamic, dynamic> groupBy(List list, dynamic iteratee) {
  return reduce(list, (Map<dynamic, dynamic> result, dynamic value, int index) {
    final key = evaluatePredicateKey(iteratee, value);
    result[key] = result[key] == null ? [value] : [...result[key], value];
    return result;
  }, {});
}
