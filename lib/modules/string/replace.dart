String replace(String string, dynamic pattern, dynamic replacement) {
  Pattern patternObj = pattern is RegExp ? pattern : RegExp(pattern.toString());
  return string.replaceAll(patternObj, replacement.toString());
}
