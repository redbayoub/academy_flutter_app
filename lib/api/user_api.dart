import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_academy/api/Constants.dart';

Future<Map<String, dynamic>> userInfoApiRequest(String accessToken) async {
  final response = await http.get(API_BASE_URL + "/user", headers: {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json",
    HttpHeaders.authorizationHeader: "Bearer $accessToken",
  });
  final responseJson = json.decode(response.body);
  responseJson["status"] = response.statusCode;
  return responseJson;
}
