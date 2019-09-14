import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_academy/api/Constants.dart';
import 'package:my_academy/api/usefull_functions.dart';

Future<Map<String, dynamic>> getCoursesApiRequest({int courseID}) async {
  String url = API_BASE_URL + "/courses";
  if (courseID != null) {
    url += "/$courseID";
  }

  final response = await http.get(url, headers: {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json"
  });

  return convertApiResponseToMap(response);
}
