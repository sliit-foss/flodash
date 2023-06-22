import '../../_utils/_array.dart';

bool _every(dynamic collection, dynamic iteratee, {bool some = false}) {
  if (collection.isEmpty) return true;
  bool result = true;
  List types = [String, num, int, double, bool, List, Map, Set, Object];
  for (int i = 0; i < collection.length; i++) {
    if (types.contains(iteratee)) {
      result = collection.elementAt(i).runtimeType == iteratee;
    } else {
      result = evaluatePredicate(iteratee, collection.elementAt(i));
    }
    if ((some && result) || !result) break;
  }
  return result;
}

bool every(dynamic collection, dynamic iteratee) =>
    _every(collection, iteratee);

bool some(dynamic collection, dynamic iteratee) =>
    _every(collection, iteratee, some: true);
