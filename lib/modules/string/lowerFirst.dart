import '_helpers/main.dart' as helpers;

Function _lowerFirst = helpers.createCaseFirst('toLowerCase');

String lowerFirst(String string) => _lowerFirst(string);
