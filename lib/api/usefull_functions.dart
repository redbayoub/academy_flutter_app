import 'dart:convert';

import 'package:http/http.dart';

Map<String, dynamic> convertApiResponseToMap(Response apiResponse) {
  Map<String, dynamic> result = {"status": apiResponse.statusCode};
  result.addAll(json.decode(apiResponse.body));
  return result;
}
