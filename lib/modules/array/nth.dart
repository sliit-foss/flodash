dynamic nth(List list, {int n = 0}) {
  if (n < 0) n = list.length + n;
  try {
    return list[n];
  } catch (e) {
    return null;
  }
}
