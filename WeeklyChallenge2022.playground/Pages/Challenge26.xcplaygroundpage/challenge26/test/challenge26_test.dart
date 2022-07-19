import 'package:challenge26/challenge26.dart';
import 'package:test/test.dart';

void main() {
  test('draw square', () {
    expect(
      drawSquare(5),
      '* * * * * \n'
      '*       * \n'
      '*       * \n'
      '*       * \n'
      '* * * * * \n',
    );
  });
  test('draw triangle', () {
    expect(
      drawTriangle(5),
      '* \n'
      '* * \n'
      '*   * \n'
      '*     * \n'
      '* * * * * \n',
    );
  });
  test('draw diamond', () {
    expect(
      drawDiamond(5),
      '        *         \n'
      '      *   *       \n'
      '    *       *     \n'
      '  *           *   \n'
      '*               * \n'
      '  *           *   \n'
      '    *       *     \n'
      '      *   *       \n'
      '        *         \n',
    );
  });
}
