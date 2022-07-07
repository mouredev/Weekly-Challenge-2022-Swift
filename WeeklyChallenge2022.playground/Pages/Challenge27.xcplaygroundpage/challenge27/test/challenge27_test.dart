import 'package:challenge27/challenge27.dart';
import 'package:test/test.dart';

void main() {
  test('Orthogonal vectors', () {
    final a = Vector(x: 2, y: 2);
    final b = Vector(x: -2, y: 2);

    expect(a.isOrthogonalWith(b), true);
  });

  test('No Orthogonal vectors', () {
    final a = Vector(x: 2, y: 2);
    final b = Vector(x: 3, y: 2);

    expect(a.isOrthogonalWith(b), false);
  });
}
