import 'capitalize.dart';

import '_helpers/main.dart' as helpers;

Function _camelCase =
    helpers.createCompounder((String result, String word, int index) {
  word = word.toLowerCase();
  return result + (index > 0 ? capitalize(word) : word);
});

/// Converts `string` to [camel case](https://en.wikipedia.org/wiki/CamelCase).
String camelCase(String string) => _camelCase(string);
