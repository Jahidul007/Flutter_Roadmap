import 'package:intl/intl.dart';

void main() {
  var data = "14/12/2021 03:34:03 PM";

  print(getFormattedDateFromFormattedString(
      value: data,
      currentFormat: "yyyy/MM/dd HH:mm:ss a",
      desiredFormat: "hh:mm a"));
}

String getFormattedDateFromFormattedString(
    {required value,
    required String currentFormat,
    required String desiredFormat,
    isUtc = false}) {
  String formattedDate = "";
  if (value != null || value.isNotEmpty) {
    try {
      DateTime dateTime =
          DateFormat(currentFormat).parse(value, isUtc).toLocal();
      formattedDate = DateFormat(desiredFormat).format(dateTime);
    } catch (e) {
      print("$e");
    }
  }
  // print("Formatted date time:  $formattedDate");
  return formattedDate;
}
