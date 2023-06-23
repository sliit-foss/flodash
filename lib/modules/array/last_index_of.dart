@Deprecated("Use inbuilt List.lastIndexOf instead")
int lastIndexOf(List list, dynamic value, {dynamic fromIndex}) {
  fromIndex ??= list.length - 1;
  return list.lastIndexOf(value, fromIndex);
}
