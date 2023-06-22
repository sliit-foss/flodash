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

    test('should replace pattern with a numeric value', () {
      String input = 'Price: \$100';
      String pattern = r'\$';
      String replacement = '200';

      String result = flodash.replace(input, pattern, replacement);

      expect(result, equals('Price: 200100'));
    });

}
