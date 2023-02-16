import '../lang/main.dart';

bool includes(dynamic collection, dynamic value, {int fromIndex = 0}) {
  try {
    if (fromIndex < 0) fromIndex = collection.length + fromIndex;
    if (collection is List) {
      return collection
          .sublist(fromIndex)
          .where((element) => isEqual(element, value))
          .isNotEmpty;
    } else if (collection is Set) {
      return collection
          .skip(fromIndex + 1)
          .where((element) => isEqual(element, value))
          .isNotEmpty;
    } else if (collection is String) {
      return collection.substring(fromIndex).contains(value);
    }
    return false;
  } catch (e) {
    return false;
  }
}
