List chunk(List list, {int size = 1}) {
  List chunks = [];
  for (int i = 0; i < list.length; i += size) {
    int end = i + size;
    if (end > list.length) end = list.length;
    chunks.add(list.sublist(i, end));
  }
  return chunks;
}

List compact(List list) {
  return list
      .where((e) =>
          e != null && e != false && e != 0 && e != double.nan && e != "")
      .toList();
}
