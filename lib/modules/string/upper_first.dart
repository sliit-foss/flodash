// Converts the first character of string to upper case.
String upperFirst([String string = '']) {
  if (string.isEmpty) return '';
  return string.substring(0, 1).toUpperCase() + string.substring(1);
}
