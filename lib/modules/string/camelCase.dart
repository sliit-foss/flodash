import 'deburr.dart';
import 'capitalize.dart';

import '_helpers/main.dart' as helpers;

Function _camelCase =
    helpers.createCompounder((String result, String word, int index) {
  word = word.toLowerCase();
  return result + (index > 0 ? capitalize(word) : word);
});

String camelCase(String string) => _camelCase(string);
