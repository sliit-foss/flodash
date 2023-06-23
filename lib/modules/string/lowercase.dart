import '_helpers/main.dart' as helpers;

Function _lowerCase =
    helpers.createCompounder((String result, String word, int index) {
  return result + (index > 0 ? ' ' : '') + word.toLowerCase();
});

/// Converts `String`, as space separated words, to lower case.
String lowerCase(String string) => _lowerCase(string);
