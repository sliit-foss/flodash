List flattenDepth(Iterable<dynamic> list, {int depth = 1}) {
  if (depth == 0) return list.toList();
  return [
    for (var element in list)
      if (element is! Iterable)
        element
      else
        ...flattenDepth(element, depth: depth - 1),
  ];
}
