List takeRight(List list, {int n = 1}) {
  try {
    return list.sublist(list.length - n);
  } catch (e) {
    return [];
  }
}
