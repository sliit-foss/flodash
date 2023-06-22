int size(dynamic collection) {
  if (collection is List || collection is Set || collection is String) {
    return collection.length;
  } else if (collection is Map) {
    return collection.keys.length;
  } else {
    throw Exception('Collection type not supported');
  }
}
