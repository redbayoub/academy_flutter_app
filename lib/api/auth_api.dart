import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_academy/api/Constants.dart';
import 'package:my_academy/api/usefull_functions.dart';

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

  return convertApiResponseToMap(response);
}

Future<Map<String, dynamic>> signUpApiRequest(String first_name,
    String last_name, String username, String email, String password) async {
  String body = json.encode({
    'first_name': first_name,
    'last_name': last_name,
    'username': username,
    'email': email,
    'password': password,
  });
  print("signup $body");

  final response =
      await http.post(API_BASE_URL + "/register", body: body, headers: {
    HttpHeaders.acceptHeader: "application/json",
    HttpHeaders.contentTypeHeader: "application/json"
  });
  return convertApiResponseToMap(response);
}
