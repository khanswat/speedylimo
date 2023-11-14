// ********************* Check Internet Connection *****************************/
import 'dart:io';

import 'package:intl/intl.dart';

Future<bool> checkConnection() async {
  var hasConnection = false;
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      hasConnection = true;
    } else {
      hasConnection = false;
    }
  } on SocketException catch (_) {
    hasConnection = false;
  }
  return hasConnection;
}

String returnMonth(DateTime date) {
  return DateFormat.MMMM().format(date);
}

String returnYear(DateTime date) {
  return DateFormat.y().format(date);
}
