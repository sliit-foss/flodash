import '_helpers/main.dart' as helpers;

/// Splits `String` into an array of its words.
List<String> words(
    {required String string, RegExp? pattern, bool guard = false}) {
  pattern = guard ? null : pattern;

  if (pattern == null) {
    return helpers.hasUnicodeWord(string)
        ? helpers.unicodeWords(string)
        : helpers.asciiWords(string);
  }
  Iterable<Match> matches = pattern.allMatches(string);
  List<String> result = [];
  for (Match match in matches) {
    result.add(match[0]!);
  }
  return result;
}
