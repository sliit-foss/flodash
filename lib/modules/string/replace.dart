/// Replaces occurrences of pattern in string with replacement.
/// Returns the modified string.
String replace(String string, dynamic pattern, dynamic replacement) {
  Pattern patternObj = pattern is RegExp ? pattern : RegExp(pattern.toString());
  if (replacement is Function) {
    return string.replaceAllMapped(patternObj, (Match match) {
      return replacement(match);
    });
  } else {
    return string.replaceAll(patternObj, replacement.toString());
  }
}
