List unzip(List list) {
  List result = [];
  for (int i = 0; i < list.length; i++) {
    for (int j = 0; j < list[i].length; j++) {
      if (result.length <= j) result.add([]);
      if (list[i][j] != null) result[j].add(list[i][j]);
    }
  }
  return result;
}
