import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('random sample from list', () {
    List li = [1, 2, 3, 4];
    expect(flodash.sample(li), isNotNull);
    expect(li.contains(flodash.sample(li)), equals(true));
  });
}
