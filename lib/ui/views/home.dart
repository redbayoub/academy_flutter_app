import 'package:flutter/material.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/ui/views/login.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentPageTitle = "Explore";

  @override
  Widget build(BuildContext context) {
    var appState = AppStateModel.of(context, true);
    if (!appState.authenticated)
      return LoginPage();
    else
      return Scaffold(
        appBar: AppBar(
          title: Text(currentPageTitle),
        ),
        body: Center(
          child: Text("Authenticated  ${appState.username}"),
        ),
      );
  }
}
