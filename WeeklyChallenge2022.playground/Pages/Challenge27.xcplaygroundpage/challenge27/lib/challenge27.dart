class Vector {
  final int x;
  final int y;

  const Vector({required this.x, required this.y});

  bool isOrthogonalWith(Vector other) {
    return ((x * other.x) + (y * other.y)) == 0;
  }
}
