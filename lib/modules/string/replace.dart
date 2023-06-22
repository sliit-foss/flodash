String replace(String string, dynamic pattern, dynamic replacement) {
  Pattern patternObj = pattern is String ? RegExp(pattern) : pattern;
  return string.replaceAll(patternObj, replacement.toString());
}
