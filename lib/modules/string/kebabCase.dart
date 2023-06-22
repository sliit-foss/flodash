import '_helpers/main.dart' as helpers;

Function _kebabCase =
    helpers.createCompounder((String result, String word, int index) {
  return result + (index > 0 ? '-' : '') + word.toLowerCase();
});

String kebabCase(String string) => _kebabCase(string);
