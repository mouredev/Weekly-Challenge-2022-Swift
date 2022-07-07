import 'dart:io';

import 'package:challenge27/challenge27.dart';

class OrthogonalCliApp {
  static final String _help = '''
  
  Usage: dart challenge27 <vector1X> <vector1Y> <vector2X> <vector2Y>

  Arguments:
  vector1X        Vector 1 axis X (int).
  vector1Y        Vector 1 axis Y (int).
  vector2X        Vector 2 axis X (int).
  vector2Y        Vector 2 axis Y (int).

  ''';

  final List<String> arguments;
  late final Vector a;
  late final Vector b;

  OrthogonalCliApp(this.arguments);

  void readArguments() {
    if (arguments.contains('--help')) {
      print(_help);
      exit(exitCode);
    }

    if (arguments.length != 4) {
      print(_help);
      exitCode = 2;
      exit(exitCode);
    }

    List<int> values = [];
    for (final argument in arguments) {
      final value = int.tryParse(argument);
      if (value == null) {
        print(_help);
        exitCode = 2;
        exit(exitCode);
      }

      values.add(value);
    }

    a = Vector(x: values[0], y: values[1]);
    b = Vector(x: values[2], y: values[3]);
  }

  void printResult() {
    print(
      'The Vectors [${a.x}, ${a.y}] and [${b.x}, ${b.y}] '
      'are${_areOrthogonal() ? '' : ' not'} Orthogonal',
    );
  }

  bool _areOrthogonal() {
    return a.isOrthogonalWith(b);
  }
}

void main(List<String> arguments) {
  exitCode = 0;

  final cliApp = OrthogonalCliApp(arguments);

  cliApp.readArguments();
  cliApp.printResult();
}
