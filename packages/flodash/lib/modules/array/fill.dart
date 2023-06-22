@Deprecated('Use inbuilt List.fillRange() instead')
List fill(List list, dynamic value, {int start = 0, dynamic end}) {
  end ??= list.length;
  list.fillRange(start, end, value);
  return list;
}
