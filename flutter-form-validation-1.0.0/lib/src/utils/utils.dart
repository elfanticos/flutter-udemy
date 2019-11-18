bool isNumeric(String value) {
  if (value.isEmpty) return false;
  final valueNumber = num.tryParse(value);
  return (valueNumber == null) ? false : true;
}
