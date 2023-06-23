@Deprecated("Use inbuilt 'value.toString()' instead")
String toString(dynamic value) {
  if (value == null) {
    return '';
  }
  return value.toString();
}
