import 'dart:io';

import 'package:challenge26/challenge26.dart';

const String _help = '''
Usage: dart challenge26 <figure> <sideSize>

Arguments:
figure      Geometric figure to print (print list of available figures for options).
side        Length of size.

Flags:
--help      Print usage information.
--figures   Print list of available figures.
''';

const String _figures = '''
List of available figures:
- $kTriangleKey 🔼
- $kSquareKey ⏹
- $kDiamondKey 🔸

Usage: dart challenge26 <figure> <sideSize>
''';

const kTriangleKey = 'triangle';
const kSquareKey = 'square';
const kDiamondKey = 'diamond';

void main(List<String> arguments) {
  exitCode = 0;

  if (arguments.contains('--help')) {
    print(_help);
    return;
  }

  if (arguments.contains('--figures')) {
    print(_figures);
    return;
  }

  if (!_validateArguments(arguments)) {
    return _invalidArguments();
  }

  if (arguments.first == kSquareKey) {
    print(drawSquare(int.parse(arguments[1])));
  } else if (arguments.first == kTriangleKey) {
    print(drawTriangle(int.parse(arguments[1])));
  } else if (arguments.first == kDiamondKey) {
    print(drawDiamond(int.parse(arguments[1])));
  }
}

bool _validateArguments(List<String> arguments) {
  return arguments.isNotEmpty &&
      arguments.length == 2 &&
      (arguments.first == kTriangleKey ||
          arguments.first == kSquareKey ||
          arguments.first == kDiamondKey) &&
      _isNumeric(arguments[1]);
}

void _invalidArguments() {
  print(_help);
  exitCode = 2;
}

bool _isNumeric(String s) {
  final converted = int.tryParse(s);
  if (converted == null) {
    return false;
  }
  if (converted < 1) {
    return false;
  }
  return true;
}
