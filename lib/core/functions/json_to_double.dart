double? toDouble(dynamic value) {
  if (value == null) return null;
  if (value is int) return value.toDouble();
  return value as double;
}
