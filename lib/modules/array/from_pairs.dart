Map<dynamic, dynamic> fromPairs(List list) {
  Map<dynamic, dynamic> map = {};
  for (int i = 0; i < list.length; i++) {
    map[list[i][0]] = list[i][1];
  }
  return map;
}
