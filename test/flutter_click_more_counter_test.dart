import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_click_more_counter/flutter_click_more_counter.dart';

void main() {
  test('ClickMoreCounter test', () {
    final clickMoreCouter = ClickMoreCounter();
    clickMoreCouter.run(() {});
    expect(clickMoreCouter.counter, 1);
  });
}
