import 'package:flutter/material.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/models/course.dart';
class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Course> _courses;

  @override
  Widget build(BuildContext context) {
    var appState = AppStateModel.of(context, true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore"),
        actions: _buildAppBarBtns(context, appState),
      ),
      body: Center(
        child: _buildCoursesList(),
      ),
    );
  }

  List<Widget> _buildAppBarBtns(BuildContext context, AppStateModel appState) {
    if (!appState.authenticated) {
      return [
        FlatButton(
          child: Text(
            "Sign in",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          color: Colors.blueAccent,
          onPressed: () => Navigator.pushNamed(context, "/LoginPage"),
        )
      ];
    }
    return [];
  }

  Widget _buildCoursesList() {
    return null;
  }
}
