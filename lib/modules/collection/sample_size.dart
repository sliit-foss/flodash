import 'sample.dart';

import '../lang/main.dart';

List sampleSize(dynamic collection, {int n = 1}) {
  List result = [];
  for (int i = 0; i < n; i++) {
    dynamic item = sample(collection);
    result.add(item);
    collection =
        collection.where((element) => !isEqual(element, item)).toList();
    if (collection.length == 0) break;
  }
  return result;
}
