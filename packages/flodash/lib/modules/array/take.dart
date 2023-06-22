List take(List list, {int n = 1}) {
  try {
    return list.sublist(0, n);
  } catch (e) {
    return [];
  }
}
