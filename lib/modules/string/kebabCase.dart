import '_helpers/main.dart' as helpers;

Function _kebabCase =
    helpers.createCompounder((String result, String word, int index) {
  return result + (index > 0 ? '-' : '') + word.toLowerCase();
});

/// Converts `String` to [kebab case](https://en.wikipedia.org/wiki/Letter_case#Special_case_styles).
String kebabCase(String string) => _kebabCase(string);
