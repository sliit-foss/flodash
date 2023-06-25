///Removes leading whitespace or specified characters from string.
String trimStart(String string, [String chars = ' ']) {
  if (string.isEmpty) return string;
  int startIndex = 0;
  if (chars.isNotEmpty) {
    while (startIndex < string.length && chars.contains(string[startIndex]))
      startIndex++;
  }
  return string.substring(startIndex);
}
