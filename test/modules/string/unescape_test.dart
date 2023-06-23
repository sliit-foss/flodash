import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should unescape HTML entities in the string', () {
    String input = 'fred, barney, &amp; pebbles';
    String result = flodash.unescape(input);
    expect(result, equals('fred, barney, & pebbles'));
  });

  test('should unescape multiple HTML entities in the string', () {
    String input = '&lt;div&gt;Hello, &quot;world&quot;!&lt;/div&gt;';
    String result = flodash.unescape(input);
    expect(result, equals('<div>Hello, "world"!</div>'));
  });

  test('should return an empty string when input is empty', () {
    String input = '';
    String result = flodash.unescape(input);
    expect(result, equals(''));
  });
}
