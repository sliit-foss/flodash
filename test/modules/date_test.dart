import 'package:flodash/flodash.dart' as flodash;

import 'package:flutter_test/flutter_test.dart';

main() {
  test('now', () {
    int currentTime = DateTime.now().millisecondsSinceEpoch;
    expect(flodash.now(), greaterThanOrEqualTo(currentTime));
  });
}
