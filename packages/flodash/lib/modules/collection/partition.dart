import 'reduce.dart';

import '../../_utils/_array.dart';

List partition(dynamic list, dynamic iteratee) {
  if (list is String) list = list.split('');
  return reduce(list, (List<List<dynamic>> result, dynamic value, int index) {
    if (evaluatePredicateKey(iteratee, value)) {
      result[0].add(value);
    } else {
      result[1].add(value);
    }
    return result;
  }, [[], []]);
}
