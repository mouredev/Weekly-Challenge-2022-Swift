String drawTriangle(int sideSize) {
  var draw = '';
  for (var i = 0; i < sideSize; i++) {
    var line = '';
    for (var j = 0; j <= i; j++) {
      if (i == sideSize - 1) {
        line += '*';
      } else if (j == 0 || j == i) {
        line += '*';
      } else {
        line += ' ';
      }
      line += ' ';
    }
    line += '\n';
    draw += line;
  }
  return draw;
}

String drawSquare(int sideSize) {
  var draw = '';
  for (var i = 0; i < sideSize; i++) {
    var line = '';
    for (var j = 0; j < sideSize; j++) {
      if (i == 0 || i == sideSize - 1) {
        line += '*';
      } else {
        if (j == 0 || j == sideSize - 1) {
          line += '*';
        } else {
          line += ' ';
        }
      }
      line += ' ';
    }
    line += '\n';
    draw += line;
  }
  return draw;
}

String drawDiamond(int sideSize) {
  var draw = '';
  for (var i = 0; i < sideSize - 1; i++) {
    draw += _drawDiamondLine(sideSize, i);
  }
  for (var i = sideSize - 1; i > -1; i--) {
    draw += _drawDiamondLine(sideSize, i);
  }
  return draw;
}

String _drawDiamondLine(int sideSize, int lineIndex) {
  var line = '';
  for (var j = 0; j < sideSize * 2 - 1; j++) {
    if (j == (sideSize - 1) - lineIndex || j == (sideSize - 1) + lineIndex) {
      line += '*';
    } else {
      line += ' ';
    }
    line += ' ';
  }
  line += '\n';
  return line;
}
