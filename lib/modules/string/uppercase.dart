/// Converts string, as space separated words, to upper case.
String upperCase([String string = '']) {
  return string
      .split(RegExp(r'[^a-zA-Z0-9]+'))
      .where((word) => word.isNotEmpty)
      .map((word) => word.toUpperCase())
      .join(' ');
}
