import 'package:flutter/material.dart';

showErrorSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String errorText) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(
      errorText,
      style: TextStyle(color: Colors.white),
    ),
    action: SnackBarAction(label: "Close", onPressed: () => {}),
  ));
}

showSucsessSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String sucsessText) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    backgroundColor: Colors.green,
    content: Text(
      sucsessText,
      style: TextStyle(color: Colors.white),
    ),
    action: SnackBarAction(label: "Close", onPressed: () => {}),
  ));
}

showSimpleSnackbar(GlobalKey<ScaffoldState> scaffoldKey, String text) {
  scaffoldKey.currentState.showSnackBar(SnackBar(
    content: Text(text),
    action: SnackBarAction(label: "Close", onPressed: () => {}),
    duration: Duration(seconds: 1),
  ));
}
