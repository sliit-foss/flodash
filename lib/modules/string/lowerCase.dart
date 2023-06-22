import '_helpers/main.dart' as helpers;

Function _lowerCase =
    helpers.createCompounder((String result, String word, int index) {
  return result + (index > 0 ? ' ' : '') + word.toLowerCase();
});

String lowerCase(String string) => _lowerCase(string);
