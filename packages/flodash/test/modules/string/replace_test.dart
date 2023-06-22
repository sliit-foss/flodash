import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('replace should replace all occurrences of pattern in the string', () {
    String input = 'Hello, Hello, Hello!';
    String expected = 'Hi, Hi, Hi!';
    String actual = flodash.replace(input, 'Hello', 'Hi');
    expect(actual, expected);
  });
  test('should replace pattern with an empty string', () {
    String input = 'Hello, World!';
    String pattern = 'o';

    String result = flodash.replace(input, pattern, '');

    expect(result, equals('Hell, Wrld!'));
  });
  test('should replace pattern using a function', () {
    String input = 'Hello, John!';
    dynamic pattern = RegExp(r'\b\w+\b');
    dynamic replacement = (match) {
      return match.group(0).toUpperCase();
    };
    String result = flodash.replace(input, pattern, replacement);
    expect(result, equals('HELLO, JOHN!'));
  });
}
