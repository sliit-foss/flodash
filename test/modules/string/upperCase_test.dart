import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should convert string to upper case with space-separated words', () {
    String input1 = '--foo-bar';
    String result1 = flodash.upperCase(input1);
    expect(result1, equals('FOO BAR'));
    String input2 = 'fooBar';
    String result2 = flodash.upperCase(input2);
    expect(result2, equals('FOOBAR'));
    String input3 = '__foo_bar__';
    String result3 = flodash.upperCase(input3);
    expect(result3, equals('FOO BAR'));
  });
  test('should return an empty string when input is empty', () {
    String input = '';
    String result = flodash.upperCase(input);
    expect(result, equals(''));
  });
}
