class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if ('.'.allMatches(newValue.text).length <= 1) {
      if (newValue.text.replaceAll("\$", "") == '') {
        return newValue;
      } else if (double.parse(newValue.text.replaceAll("\$", "")) < min) {
        return const TextEditingValue().copyWith(text: min.toStringAsFixed(2));
      } else {
        return double.parse(newValue.text.replaceAll("\$", "")) > max
            ? oldValue
            : newValue;
      }
    } else {
      return oldValue;
    }
  }
}
