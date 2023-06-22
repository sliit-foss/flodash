List tail(List list) {
  try {
    return list.sublist(1);
  } catch (e) {
    return [];
  }
}
