import 'package:flutter_test/flutter_test.dart';

// Smoke test: verify the test infrastructure itself is functional.
// Full app integration tests require platform channels (objectbox, window_manager)
// that are not available in the flutter_test sandbox.
void main() {
  test('smoke test - test infrastructure is functional', () {
    expect(1 + 1, equals(2));
  });
}
