import 'dart:ffi';

import '_helpers/main.dart' as helpers;

Function _upperFirst = helpers.createCaseFirst('toUpperCase');

String capitalize(String string) => _upperFirst(string.toLowerCase());
