import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_academy/api/Constants.dart';

Future<Map<String, dynamic>> loginApiRequest(
    String email, String password) async {
  String body = json.encode({
    'email': email,
    'password': password,
  });
  print("login $body");

  final response =
      await http.post(API_BASE_URL + "/login", body: body, headers: {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json"
  });

  final responseJson = json.decode(response.body);
  responseJson["status"] = response.statusCode;
  return responseJson;
}
