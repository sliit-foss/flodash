import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert the first character of string to upper case', () {
    String input1 = 'fred';
    String result1 = flodash.upperFirst(input1);
    expect(result1, equals('Fred'));

    String input2 = 'FRED';
    String result2 = flodash.upperFirst(input2);
    expect(result2, equals('FRED'));

    String input3 = '';
    String result3 = flodash.upperFirst(input3);
    expect(result3, equals(''));
  });
}