import 'package:flutter/material.dart';
import 'package:my_academy/api/user_api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateModel extends Model {
  bool _authenticated = false;
  String _accessToken;
  int _id;
  String _username;
  String _firstName;
  String _lastName;
  bool _isAdmin;

  final SharedPreferences prefs;

  bool get authenticated => _authenticated;
  String get accessToken => _accessToken;
  int get id => _id;
  String get username => _username;
  String get firstName => _firstName;
  String get lastName => _lastName;
  bool get isAdmin => _isAdmin;

  AppStateModel(this.prefs) {
    refresh();
  }

  void refresh() async {
    // TODO Check if the stored token has expired
    /*  var expiresStr = prefs.getString('expires');
    if (expiresStr != null) {
      _expires = DateTime.parse(expiresStr);
      var remaining = _expires.difference(DateTime.now());
      if (remaining.inSeconds < 3600) {
        var auth = await Auth0Client().refreshToken(prefs.getString('refreshToken'));
        if (auth != null && auth.containsKey('access_token') ) {
          logIn(auth);
        } else {
          prefs.remove('userToken');
          prefs.remove('expires');
          _authenticated = false;
          _userToken = null;
          _expires = null;
        }
        notifyListeners();
        return;
      }
    } */
    //
    _accessToken = prefs.getString('accessToken');
    if (_accessToken != null) {
      _authenticated = true;
      final userInfoResponse = userInfoApiRequest(_accessToken);
      setUserInfo(userInfoResponse);
    }
    notifyListeners();
  }

  void setUserInfo(userData) {
    /* if (data == null) {
      return;
    }

    if (data.containsKey('accessToken')) {
      prefs.setString('accessToken', data['accessToken']);
      _accessToken = data['accessToken'];

      // set authenticated
      prefs.setBool('authenticated', true);
      _authenticated = true;
    } */
    // set user data
    //final userData = data["user"];
    if (userData.containsKey('username')) {
      prefs.setString('username', userData['username']);
      _username = userData['username'];
    }
    if (userData.containsKey('id')) {
      prefs.setInt('id', userData['id']);
      _id = userData['id'];
    }
    if (userData.containsKey('first_name')) {
      prefs.setString('first_name', userData['first_name']);
      _firstName = userData['first_name'];
    }
    if (userData.containsKey('last_name')) {
      prefs.setString('last_name', userData['last_name']);
      _lastName = userData['last_name'];
    }
    if (userData.containsKey('is_admin')) {
      prefs.setBool('is_admin', (userData['is_admin'] == 1));
      _isAdmin = (userData['is_admin'] == 1);
    }

    notifyListeners();
  }

  void logIn(data) {
    if (data == null) {
      return;
    }
    if (data.containsKey('accessToken')) {
      prefs.setString('accessToken', data['accessToken']);
      _accessToken = data['accessToken'];
      _authenticated = true;
    }
    setUserInfo(data['user']);

    notifyListeners();
  }

  void logOut() {
    /* When logging out, the app session is cleared and a new login is needed.
    However, if Auth0 is configured with an IdP, like Google, and the account
    is logged into Google on the device, the user will be directly logged in.
    If closeSessions() is called, the Auth0 session and the IdP session will be 
    logged out. However, the user will be redirected to the IdP login page, which
    may be confusing.
    */
    // Auth0Client().closeSessions();
    _authenticated = false;
    _accessToken = null;
    _username = null;
    _id = -1;
    _firstName = null;
    _lastName = null;
    _isAdmin = false;
    prefs.clear();
    notifyListeners();
  }

  static AppStateModel of(BuildContext context, rebuild) =>
      ScopedModel.of<AppStateModel>(context, rebuildOnChange: rebuild);
}
