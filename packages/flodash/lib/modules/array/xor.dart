import '../../_utils/_array.dart';
import '../../_utils/_varargs.dart';

List _xor(List arguments, {dynamic iteratee}) {
  List list = arguments.first;
  for (List li in arguments.sublist(1)) {
    for (dynamic element in li) {
      if (list
          .where((e) => evaluateOperation(e, element, comparator: iteratee))
          .isEmpty) {
        list.add(element);
      } else {
        if (iteratee != null) {
          list.removeWhere(
              (e) => evaluateOperation(e, element, comparator: iteratee));
        } else {
          list.remove(element);
        }
      }
    }
  }
  return list;
}

final xor = VarargsFunction((arguments) => _xor(arguments)) as dynamic;

final xorWith = VarargsFunction((arguments) {
  List argumentClone = [...arguments];
  dynamic iteratee = argumentClone.removeLast();
  return _xor(argumentClone, iteratee: iteratee);
}) as dynamic;
