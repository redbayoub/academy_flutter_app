import 'package:flutter/material.dart';
import 'package:my_academy/api/course_api.dart';
import 'package:my_academy/models/appstate.dart';
import 'package:my_academy/models/course.dart';
import 'package:my_academy/models/links.dart';
import 'package:my_academy/models/meta.dart';
import 'package:my_academy/ui/views/explore/course_card.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<Course> _courses = [];
  Meta _meta;
  Links _links;

  @override
  void initState() {
    super.initState();
    getCoursesApiRequest().then((Map<String, dynamic> response) {
      if (response["status"] != 200) return;
      Meta meta = metaFromJson(response["meta"]);
      Links links = linksFromJson(response["links"]);
      List l = List.from(response["data"]);
      print(l);
      List<Course> courses =
          l.map((jsonCourse) => courseFromJson(jsonCourse)).toList();

      setState(() {
        _courses = courses;
        _meta = meta;
        _links = links;
      });
    });
  }

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
    return ListView.builder(
      itemCount: _courses.length,
      itemBuilder: (conext, index) => CourseCard(_courses[index]),
    );
  }
}
